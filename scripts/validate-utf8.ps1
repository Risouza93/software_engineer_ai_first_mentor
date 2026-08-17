param(
    [string[]]$Extensions = @(".md", ".txt", ".log", ".ps1", ".psm1", ".json", ".yml", ".yaml", ".js", ".ts", ".tsx", ".jsx", ".html", ".css")
)

$ErrorActionPreference = "Stop"

$repoRoot = (git rev-parse --show-toplevel).Trim()
if (-not $repoRoot) {
    throw "Não foi possível localizar a raiz do repositório Git."
}

$utf8Strict = New-Object System.Text.UTF8Encoding($false, $true)
$invalidos = @()

git ls-files | ForEach-Object {
    $relativo = $_
    $ext = [System.IO.Path]::GetExtension($relativo)

    if ($Extensions -contains $ext) {
        $absoluto = Join-Path $repoRoot $relativo

        if (Test-Path -LiteralPath $absoluto -PathType Leaf) {
            try {
                $bytes = [System.IO.File]::ReadAllBytes($absoluto)
                $null = $utf8Strict.GetString($bytes)
            }
            catch {
                $invalidos += $relativo
            }
        }
    }
}

if ($invalidos.Count -gt 0) {
    Write-Host "Arquivos invalidos como UTF-8: $($invalidos.Count)"
    $invalidos | ForEach-Object { Write-Host " - $_" }
    exit 1
}

Write-Host "UTF-8 OK: nenhum arquivo textual versionado invalido foi encontrado."
exit 0
