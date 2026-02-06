param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("setup","test","spec-check")]
    [string]$Command
)

switch ($Command) {
    "setup" {
        Write-Host "Building Docker image for Chimera..."
        docker build -t chimera-agent .
    }

    "test" {
        Write-Host "Running tests inside Docker (expected to fail for TDD)..."
        docker run --rm -v ${PWD}:/app chimera-agent pytest tests/
    }

    "spec-check" {
        Write-Host "Checking code for spec references..."
        docker run --rm -v ${PWD}:/app chimera-agent grep -R "Ref: specs" skills/ src/ 2>$null
    }
}
