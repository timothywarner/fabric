# Microsoft Fabric Quick Reference Guide

## Essential Links
- [Microsoft Fabric Portal](https://fabric.microsoft.com)
- [Fabric Documentation](https://learn.microsoft.com/fabric/)
- [Fabric Trial Signup](https://www.microsoft.com/microsoft-fabric)
- [GitHub Repository](https://github.com/timothywarner/fabric)

## Common Commands

### Azure CLI
```bash
# Login to Azure
az login

# Set subscription
az account set --subscription <subscription-id>

# Create resource group
az group create --name <rg-name> --location <location>
```

### Fabric Workspace
```powershell
# Connect to Fabric workspace
Connect-PowerBIServiceAccount

# List workspaces
Get-PowerBIWorkspace
```

### Git Commands
```bash
# Clone repository
git clone https://github.com/timothywarner/fabric.git

# Update repository
git pull origin main
```

## Troubleshooting Guide

### Common Issues

1. **Fabric Trial Activation**
   - Issue: "Unable to activate Fabric trial"
   - Solution: Ensure Azure AD account has proper permissions
   - Fallback: Use pre-activated demo environment

2. **Workspace Access**
   - Issue: "Cannot access workspace"
   - Solution: Check workspace permissions and capacity
   - Fallback: Use shared demo workspace

3. **Data Ingestion**
   - Issue: "Pipeline fails to copy data"
   - Solution: Verify source/destination permissions
   - Fallback: Use sample data from assets folder

4. **Notebook Execution**
   - Issue: "Notebook kernel not starting"
   - Solution: Check compute resources
   - Fallback: Use pre-executed notebook

5. **Power BI Connection**
   - Issue: "Direct Lake connection fails"
   - Solution: Verify lakehouse permissions
   - Fallback: Use import mode temporarily

### Environment Setup

1. **Prerequisites Check**
   ```powershell
   # Check Azure CLI
   az version

   # Check PowerShell
   $PSVersionTable

   # Check Git
   git --version
   ```

2. **Fabric Access**
   ```powershell
   # Verify Fabric access
   Get-PowerBICapacity
   ```

## Demo Environment

### Pre-built Resources
- Demo workspace: `contoso-fabric-demo`
- Sample lakehouse: `contoso-lakehouse`
- Test datasets: `assets/datasets/`

### Backup Demos
- Recorded demos: `demos/recordings/`
- Sample notebooks: `assets/templates/`
- Pre-built pipelines: `assets/templates/`

## Quick Navigation

### During Class
- Lesson Plan: `instructor/lesson-plan.md`
- Timing Guide: `instructor/timing-guide.md`
- Teaching Notes: `instructor/teaching-notes/`

### Labs
- Setup: `labs/setup/`
- Segment Labs: `labs/01-intro/` through `labs/05-delivery/`

### Demos
- Pre-built: `demos/01-intro/` through `demos/05-delivery/`
- Templates: `assets/templates/`

## Emergency Contacts
- Microsoft Support: [Fabric Support](https://learn.microsoft.com/fabric/support)
- GitHub Issues: [Repository Issues](https://github.com/timothywarner/fabric/issues)

## Notes
- Keep this guide open during teaching
- Update with new issues/solutions
- Add student questions and answers
- Document successful workarounds 