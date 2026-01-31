# **Jenkins vs GitHub Actions: Complete CI/CD Comparison**

## **📖 About This Repository**

This repository demonstrates **two complete CI/CD implementations** for the same project:
1. **Jenkins** (Traditional, self-hosted CI/CD)
2. **GitHub Actions** (Modern, cloud-native CI/CD)

Both implementations perform **identical tasks** - from code checkout to deployment simulation - allowing you to compare and learn both technologies side-by-side.

## **🎯 Purpose**

- **For Learners**: See how the same CI/CD workflow is implemented in two different tools
- **For Teams**: Compare Jenkins vs GitHub Actions for your project needs
- **For Migration**: Guide for moving from Jenkins to GitHub Actions (or vice versa)

## **📁 Repository Structure**

```
.github/workflows/
├── jenkins-to-actions.yml    # GitHub Actions workflow (CI/CD)
Jenkinsfile                    # Jenkins pipeline definition (CI/CD)
test.bat                       # Automated tests for both platforms
README.md                      # This documentation
```

## **🔧 Technologies Demonstrated**

### **1. Jenkins Implementation**
- **Pipeline-as-Code** (Jenkinsfile)
- **Multi-stage builds** (7 stages)
- **Windows agent support**
- **Email notifications** with HTML formatting
- **Poll SCM** (automatic triggering)
- **Git integration**
- **Workspace management**
- **Artifact archiving**

### **2. GitHub Actions Implementation**
- **Workflow-as-Code** (YAML)
- **Windows runner support**
- **Email notifications** via Gmail
- **Automatic triggers** (push, PR, manual)
- **Parallel jobs** (build + deploy)
- **Artifact uploads**
- **Secrets management**
- **Multi-step workflows**

## **🚀 Getting Started**

### **Prerequisites**
- **For Jenkins**: Java 11+, Jenkins 2.440+, Windows/Linux server
- **For GitHub Actions**: GitHub account, repository access
- **Common**: Git, basic command-line knowledge

### **Quick Start - Jenkins**

#### **1. Install & Configure Jenkins**
```bash
# Windows (via Chocolatey)
choco install jenkins

# Or download from: https://www.jenkins.io/download/
```

#### **2. Set Up Jenkins Pipeline**
1. **Create new item** → **Pipeline**
2. **Pipeline from SCM** → **Git**
3. Repository URL: `https://github.com/Maha-Jr10/simple-jenkins-test.git`
4. **Script Path**: `Jenkinsfile`
5. **Save & Run**

#### **3. Configure Email (Optional)**
```
SMTP server: smtp.gmail.com
Port: 587
Username: your-email@gmail.com
Password: [App Password]
Use TLS: ✓
```

### **Quick Start - GitHub Actions**

#### **1. Fork or Clone This Repository**
```bash
git clone https://github.com/Maha-Jr10/simple-jenkins-test.git
```

#### **2. Add Secrets (Optional)**
In repository → **Settings** → **Secrets and variables** → **Actions**:
- `GMAIL_USERNAME`: Your Gmail address
- `GMAIL_APP_PASSWORD`: Gmail App Password (16 characters)

#### **3. Push to Trigger Workflow**
```bash
git add .
git commit -m "Trigger GitHub Actions"
git push
```

## **🔄 What Each CI/CD Tool Does**

### **Common Stages (Both Implementations):**

| Stage | Jenkins (Jenkinsfile) | GitHub Actions (YAML) | Purpose |
|-------|----------------------|----------------------|---------|
| **Checkout** | `checkout scm` | `actions/checkout@v4` | Get code from repository |
| **Hello** | `echo 'Hello from Jenkins!'` | `echo 'Hello from GitHub Actions!'` | Welcome message |
| **System Info** | `ver`, `systeminfo` | `cmd /c ver`, `Get-CimInstance` | Display OS/hardware info |
| **Workspace** | `dir /B`, `pwd` | `Get-ChildItem` | Show workspace contents |
| **Git Test** | `git --version`, `git log` | `git --version`, `git log` | Verify Git integration |
| **Run Tests** | `call test.bat` | `cmd /c test.bat` | Run automated tests |
| **Success** | Final success message | Final success message | Completion confirmation |
| **Email** | `emailext` plugin | `dawidd6/action-send-mail` | Send notifications |
| **Deploy** | Simulated deployment | Parallel job with simulation | Deployment simulation |

### **Key Differences:**

| Feature | Jenkins | GitHub Actions |
|---------|---------|---------------|
| **Infrastructure** | Self-hosted (your servers) | Cloud-hosted (GitHub runners) |
| **Configuration** | Jenkinsfile (Groovy) | YAML files |
| **Cost** | Free + server costs | Free for public, limits for private |
| **Setup Time** | 30+ minutes | 5 minutes |
| **Trigger Methods** | Poll SCM, webhooks, cron | Push, PR, schedule, manual |
| **Notifications** | Email, plugins required | Email, built-in, marketplace |
| **Parallel Jobs** | Complex setup | Simple YAML syntax |
| **Artifacts** | Archive to Jenkins server | Upload to GitHub |

## **📊 Test Suite (`test.bat`)**

Both CI/CD systems run the same automated tests:

```batch
@echo off
echo Running tests...
echo Test 1: Checking Jenkinsfile exists...
if exist Jenkinsfile (
    echo ✅ Jenkinsfile found
) else (
    echo ❌ Jenkinsfile missing
    exit 1
)

echo Test 2: Checking README exists...
if exist README.md (
    echo ✅ README.md found
) else (
    echo ❌ README.md missing
    exit 1
)

echo Test 3: Directory structure...
dir /B

echo ✅ All tests passed!
```

## **🔐 Security Configuration**

### **Jenkins**
- Credentials stored in Jenkins server
- SMTP passwords in Jenkins configuration
- Access control via Jenkins security

### **GitHub Actions**
- Secrets in repository settings
- Environment-specific secrets
- OIDC for cloud authentication

## **📈 Performance Comparison**

| Metric | Jenkins (Local) | GitHub Actions (Cloud) |
|--------|----------------|---------------------|
| **Startup Time** | Instant (server running) | 30-60 seconds (VM spin-up) |
| **Build Duration** | ~30 seconds | ~1 minute |
| **Cost** | Server electricity/internet | Free: 2,000 min/month (private) |
| **Scalability** | Limited by your hardware | GitHub infrastructure |

## **🎯 Learning Objectives**

### **After This Tutorial, You'll Understand:**
1. **CI/CD Fundamentals**: What each stage means
2. **Pipeline Structure**: How to structure multi-stage builds
3. **Tool Comparison**: Strengths/weaknesses of each tool
4. **Migration Path**: How to move from one to another
5. **Best Practices**: Industry standards for CI/CD

### **Skills Gained:**
- ✅ Writing Jenkinsfiles (Groovy)
- ✅ Creating GitHub Actions workflows (YAML)
- ✅ Configuring automated testing
- ✅ Setting up notifications
- ✅ Managing secrets and credentials
- ✅ Debugging CI/CD pipelines

## **🔧 Customization Guide**

### **For Your Own Project:**

#### **1. Replace Test Suite**
```bash
# Remove test.bat, add your own:
# - npm test (Node.js)
# - pytest (Python)
# - mvn test (Java)
# - go test (Go)
```

#### **2. Add Build Steps**
```yaml
# In Jenkinsfile or GitHub Actions:
# - Install dependencies
# - Compile code
# - Run linters
# - Security scans
```

#### **3. Add Deployment**
```yaml
# Deploy to:
# - AWS S3 (static sites)
# - Heroku (apps)
# - Docker Hub (containers)
# - Kubernetes (clusters)
```

## **🚨 Troubleshooting**

### **Common Issues:**

#### **Jenkins:**
```
"Selected Git installation does not exist"
→ Install Git on Jenkins server
→ Configure in Global Tool Configuration

"Connection error sending email"
→ Use App Password, not regular password
→ Enable 2FA on Gmail first
```

#### **GitHub Actions:**
```
"Resource not accessible by integration"
→ Check repository permissions
→ Ensure workflow file is in correct path

"Invalid SMTP credentials"
→ Use App Password, not regular password
→ Verify secrets are correctly set
```

## **📚 Resources**

### **Documentation:**
- [Jenkins Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Gmail App Passwords](https://support.google.com/accounts/answer/185833)

### **Learning:**
- [Jenkins Tutorial for Beginners](https://www.jenkins.io/doc/tutorials/)
- [GitHub Actions Quickstart](https://docs.github.com/en/actions/quickstart)
- [CI/CD Best Practices](https://www.redhat.com/en/topics/devops/what-cicd-pipeline)

## **🤝 Contributing**

### **Want to Improve This Project?**
1. **Add more examples**: Docker builds, cloud deployments
2. **Improve documentation**: Add troubleshooting tips
3. **Add tests**: More comprehensive test suites
4. **Compare with other tools**: GitLab CI, CircleCI, etc.

### **Pull Request Process:**
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test both Jenkins and GitHub Actions
5. Submit pull request

## **📄 License**

This project is open source and available under the [MIT License](LICENSE).

## **👨‍💻 Author**

**Muhammed John**
- GitHub: [@Maha-Jr10](https://github.com/Maha-Jr10)
- Email: muhammedjohn3@gmail.com
- Project: Learning CI/CD with Jenkins and GitHub Actions

## **⭐ Show Your Support**

If this repository helped you learn CI/CD:

1. **Star this repo** ⭐
2. **Share with colleagues** 👥
3. **Contribute improvements** 🔧
4. **Follow for updates** 🔔

---

## **🎯 Which Should You Choose?**

### **Choose Jenkins If:**
- You need full control over infrastructure
- You have complex, custom requirements
- You're in an enterprise environment
- You need to integrate with on-premises systems

### **Choose GitHub Actions If:**
- Your code is already on GitHub
- You want quick setup and minimal maintenance
- You prefer cloud-native solutions
- You're working on open source projects

### **Or Use Both!**
Many teams use:
- **GitHub Actions** for PR validation and testing
- **Jenkins** for production deployments and legacy systems

---

**Happy CI/CD Building!** 🚀

*Last updated: January 2026*
