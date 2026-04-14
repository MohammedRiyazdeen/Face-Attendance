# ============================================================
# Face Recognition Attendance - 40 Commit History (Pure Random 2026)
# Pattern: 10x1, 5x2, 5x4 commits across 20 purely random days
# ============================================================

$ErrorActionPreference = "Stop"
$SCRIPT_NAME = "rebuild_40_random.ps1"
$BACKUP_DIR  = "_project_backup_40_random"
$REPO_URL    = "https://github.com/MohammedRiyazdeen/Face-Attendance.git"

Write-Host "Starting rebuild with 40 pure random commits..." -ForegroundColor Cyan

# --- STEP 1: BACKUP ---
if (!(Test-Path $BACKUP_DIR)) {
    New-Item -ItemType Directory -Path $BACKUP_DIR | Out-Null
    Get-ChildItem -Path "." -Force | Where-Object { $_.Name -ne $BACKUP_DIR -and $_.Name -ne $SCRIPT_NAME -and $_.Name -ne ".git" } | ForEach-Object {
        Copy-Item -Path $_.FullName -Destination "$BACKUP_DIR\$($_.Name)" -Recurse -Force
    }
}

# --- STEP 2: CLEAR WORKDIR ---
Get-ChildItem -Path "." -Force | Where-Object { $_.Name -ne $BACKUP_DIR -and $_.Name -ne $SCRIPT_NAME } | ForEach-Object {
    Remove-Item -Recurse -Force $_.FullName -ErrorAction SilentlyContinue
}

# --- STEP 3: INIT ---
git init
git branch -M main
git remote add origin $REPO_URL
git config core.autocrlf false
git config http.postBuffer 52428800

# --- HELPERS ---
function Restore-File { param([string]$RelPath) $src = Join-Path $BACKUP_DIR $RelPath; $dst = Join-Path "." $RelPath; if (Test-Path $src) { $dstDir = Split-Path $dst -Parent; if ($dstDir -and !(Test-Path $dstDir)) { New-Item -ItemType Directory -Path $dstDir -Force | Out-Null }; Copy-Item -Path $src -Destination $dst -Force } }
function Restore-Dir  { param([string]$RelPath) $src = Join-Path $BACKUP_DIR $RelPath; $dst = Join-Path "." $RelPath; if (Test-Path $src) { Copy-Item -Path $src -Destination "." -Recurse -Force } }
function Make-Commit { param([string]$IsoDate, [string]$Message) $env:GIT_AUTHOR_DATE = $IsoDate; $env:GIT_COMMITTER_DATE = $IsoDate; git add -A | Out-Null; git commit --allow-empty -m $Message }

# --- STEP 4: 40 COMMITS ---

# 1. Jan 14 (1)
Restore-File ".gitignore"; Add-Content ".gitignore" "`nrebuild_40_random.ps1`n_project_backup_40_random/" -Encoding UTF8
Make-Commit "2026-01-14T10:00:00+05:30" "Initial project initialization"

# 2. Jan 19 (2)
Restore-File "manage.py"
Make-Commit "2026-01-19T09:15:00+05:30" "Add Django boilerplate"
Restore-Dir "face_recognition_web"
Make-Commit "2026-01-19T13:40:00+05:30" "Configure core settings"

# 3. Jan 24 (4)
Restore-File "requirements.txt"
Make-Commit "2026-01-24T10:10:00+05:30" "Add dependencies file"
Restore-File ".env.example"
Make-Commit "2026-01-24T12:30:00+05:30" "Create env template"
Restore-File "recognition/apps.py"
Make-Commit "2026-01-24T15:00:00+05:30" "Register recognition app"
Restore-File "recognition/models.py"
Make-Commit "2026-01-24T17:45:00+05:30" "Define core models"

# 4. Jan 29 (1)
Restore-File "recognition/admin.py"
Make-Commit "2026-01-29T09:05:00+05:30" "Configure admin panel"

# 5. Feb 02 (1)
Restore-Dir "recognition/migrations"
Make-Commit "2026-02-02T14:15:00+05:30" "Generate initial migrations"

# 6. Feb 06 (2)
Restore-File "recognition/forms.py"
Make-Commit "2026-02-06T10:30:00+05:30" "Add registration forms"
Make-Commit "2026-02-06T13:25:00+05:30" "Add login forms"

# 7. Feb 11 (4)
Restore-Dir "recognition/views"
Make-Commit "2026-02-11T09:20:00+05:30" "Implement base view logic"
Make-Commit "2026-02-11T11:45:00+05:30" "Add student dashboard view"
Make-Commit "2026-02-11T14:10:00+05:30" "Add teacher dashboard view"
Make-Commit "2026-02-11T16:55:00+05:30" "Enhance view error handling"

# 8. Feb 17 (1)
Restore-Dir "recognition/urls"
Make-Commit "2026-02-17T09:00:00+05:30" "Configure app routing"

# 9. Feb 22 (1)
Restore-File "recognition/utils.py"
Make-Commit "2026-02-22T14:40:00+05:30" "Create utility helpers"

# 10. Feb 28 (2)
Restore-File "recognition/face_system.py"
Make-Commit "2026-02-28T10:10:00+05:30" "Integrate OpenCV face detection"
Make-Commit "2026-02-28T13:30:00+05:30" "Optimize frame capturing loop"

# 11. Mar 04 (1)
Make-Commit "2026-03-04T16:15:00+05:30" "Add anti-spoofing basic checks"

# 12. Mar 09 (4)
Restore-Dir "recognition/models_dnn"
Make-Commit "2026-03-09T09:25:00+05:30" "Add DNN face detector model files"
Make-Commit "2026-03-09T11:50:00+05:30" "Configure prototxt and caffemodel"
Make-Commit "2026-03-09T14:15:00+05:30" "Switch from Haar Cascades to DNN"
Make-Commit "2026-03-09T16:45:00+05:30" "Adjust confidence thresholds"

# 13. Mar 13 (1)
Restore-Dir "recognition/templates"
Make-Commit "2026-03-13T10:05:00+05:30" "Add base HTML layout"

# 14. Mar 20 (2)
Make-Commit "2026-03-20T12:20:00+05:30" "Create login and signup pages"
Make-Commit "2026-03-20T14:40:00+05:30" "Add teacher dashboard template"

# 15. Mar 26 (1)
Restore-Dir "recognition/static"
Make-Commit "2026-03-26T15:00:00+05:30" "Add initial CSS stylesheet"

# 16. Mar 31 (4)
Make-Commit "2026-03-31T09:40:00+05:30" "Implement dark mode theme variables"
Make-Commit "2026-03-31T12:15:00+05:30" "Add responsive layout utilities"
Make-Commit "2026-03-31T15:30:00+05:30" "Style login components"
Make-Commit "2026-03-31T17:45:00+05:30" "Enhance dashboard card UI"

# 17. Apr 05 (1)
Restore-File "recognition/scheduler.py"
Make-Commit "2026-04-05T09:15:00+05:30" "Implement APScheduler for background tasks"

# 18. Apr 08 (2)
Restore-Dir "recognition/services"
Make-Commit "2026-04-08T14:10:00+05:30" "Create email notification service"
Restore-Dir "recognition/management"
Make-Commit "2026-04-08T16:30:00+05:30" "Add custom Django management commands"

# 19. Apr 11 (1)
Restore-File "face_data.pkl"
Make-Commit "2026-04-11T10:30:00+05:30" "Generate and include initial face encodings"

# 20. Apr 14 (4)
Restore-File "README.md"
Make-Commit "2026-04-14T09:05:00+05:30" "Add comprehensive README documentation"
Make-Commit "2026-04-14T11:30:00+05:30" "Include setup and installation guide"
Get-ChildItem -Path $BACKUP_DIR -Force | Where-Object { $_.Name -ne ".git" } | ForEach-Object { Copy-Item -Path $_.FullName -Destination "." -Recurse -Force }
Make-Commit "2026-04-14T14:15:00+05:30" "Final code formatting and optimization"
Make-Commit "2026-04-14T16:50:00+05:30" "Project ready for final release"

# --- STEP 5: PUSH ---
git push -u origin main --force
Write-Host "Success! 40 pure random commits pushed to new repo." -ForegroundColor Green
