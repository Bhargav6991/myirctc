<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DevOps Learning Tracker</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
      background: #f4f7fb;
      padding: 30px;
      color: #222;
    }

    h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #1d3557;
    }

    .progress-container {
      width: 100%;
      background: #ddd;
      border-radius: 20px;
      overflow: hidden;
      margin-bottom: 15px;
      height: 30px;
    }

    .progress-bar {
      height: 100%;
      width: 0%;
      background: linear-gradient(90deg, #4caf50, #2ecc71);
      text-align: center;
      color: white;
      line-height: 30px;
      font-weight: bold;
      transition: width 0.4s ease;
    }

    .summary {
      text-align: center;
      font-size: 18px;
      margin-bottom: 30px;
      font-weight: bold;
    }

    .category {
      background: white;
      border-radius: 12px;
      padding: 20px;
      margin-bottom: 25px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.08);
    }

    .category h2 {
      margin-bottom: 15px;
      color: #0d3b66;
      border-bottom: 2px solid #eee;
      padding-bottom: 10px;
    }

    .topic {
      display: flex;
      align-items: center;
      padding: 8px 0;
      border-bottom: 1px solid #f1f1f1;
    }

    .topic:last-child {
      border-bottom: none;
    }

    input[type="checkbox"] {
      margin-right: 12px;
      width: 18px;
      height: 18px;
      cursor: pointer;
    }

    label {
      cursor: pointer;
      width: 100%;
    }

    .completed {
      text-decoration: line-through;
      color: #777;
    }

    footer {
      text-align: center;
      margin-top: 30px;
      color: #666;
      font-size: 14px;
    }
  </style>
</head>
<body>

  <h1>DevOps Learning Progress Tracker</h1>

  <div class="progress-container">
    <div class="progress-bar" id="progressBar">0%</div>
  </div>

  <div class="summary">
    Completed: <span id="completedCount">0</span> / <span id="totalCount">0</span>
  </div>

  <!-- AWS -->
  <div class="category">
    <h2>AWS</h2>
    <div class="topic"><input type="checkbox"><label>EC2</label></div>
    <div class="topic"><input type="checkbox"><label>VPC</label></div>
    <div class="topic"><input type="checkbox"><label>IAM</label></div>
    <div class="topic"><input type="checkbox"><label>S3</label></div>
    <div class="topic"><input type="checkbox"><label>Route 53</label></div>
    <div class="topic"><input type="checkbox"><label>Load Balancer</label></div>
    <div class="topic"><input type="checkbox"><label>Auto Scaling</label></div>
    <div class="topic"><input type="checkbox"><label>CloudWatch</label></div>
    <div class="topic"><input type="checkbox"><label>Security Groups & NACL</label></div>
  </div>

  <!-- Linux -->
  <div class="category">
    <h2>Linux</h2>
    <div class="topic"><input type="checkbox"><label>File Permissions</label></div>
    <div class="topic"><input type="checkbox"><label>User Management</label></div>
    <div class="topic"><input type="checkbox"><label>find / grep / awk / sed</label></div>
    <div class="topic"><input type="checkbox"><label>Process Management</label></div>
    <div class="topic"><input type="checkbox"><label>Networking Commands</label></div>
    <div class="topic"><input type="checkbox"><label>Systemctl & Services</label></div>
    <div class="topic"><input type="checkbox"><label>Shell Scripting</label></div>
  </div>

  <!-- Git -->
  <div class="category">
    <h2>Git & GitHub</h2>
    <div class="topic"><input type="checkbox"><label>git init / clone</label></div>
    <div class="topic"><input type="checkbox"><label>git add / commit / push</label></div>
    <div class="topic"><input type="checkbox"><label>Branching & Merging</label></div>
    <div class="topic"><input type="checkbox"><label>Pull Requests</label></div>
    <div class="topic"><input type="checkbox"><label>git reset / revert / restore</label></div>
  </div>

  <!-- Docker -->
  <div class="category">
    <h2>Docker</h2>
    <div class="topic"><input type="checkbox"><label>Docker Installation</label></div>
    <div class="topic"><input type="checkbox"><label>Dockerfile</label></div>
    <div class="topic"><input type="checkbox"><label>Docker Images</label></div>
    <div class="topic"><input type="checkbox"><label>Docker Containers</label></div>
    <div class="topic"><input type="checkbox"><label>Docker Volumes</label></div>
    <div class="topic"><input type="checkbox"><label>Docker Networking</label></div>
    <div class="topic"><input type="checkbox"><label>Docker Compose</label></div>
  </div>

  <!-- Jenkins -->
  <div class="category">
    <h2>Jenkins</h2>
    <div class="topic"><input type="checkbox"><label>Freestyle Jobs</label></div>
    <div class="topic"><input type="checkbox"><label>Pipeline Jobs</label></div>
    <div class="topic"><input type="checkbox"><label>Jenkinsfile</label></div>
    <div class="topic"><input type="checkbox"><label>Plugins</label></div>
    <div class="topic"><input type="checkbox"><label>SSH Publisher</label></div>
    <div class="topic"><input type="checkbox"><label>CI/CD Pipeline</label></div>
  </div>

  <!-- Maven -->
  <div class="category">
    <h2>Maven</h2>
    <div class="topic"><input type="checkbox"><label>pom.xml</label></div>
    <div class="topic"><input type="checkbox"><label>Dependencies</label></div>
    <div class="topic"><input type="checkbox"><label>clean install</label></div>
    <div class="topic"><input type="checkbox"><label>WAR/JAR Build</label></div>
  </div>

  <!-- Kubernetes -->
  <div class="category">
    <h2>Kubernetes</h2>
    <div class="topic"><input type="checkbox"><label>Pods</label></div>
    <div class="topic"><input type="checkbox"><label>Deployments</label></div>
    <div class="topic"><input type="checkbox"><label>Services</label></div>
    <div class="topic"><input type="checkbox"><label>Ingress</label></div>
    <div class="topic"><input type="checkbox"><label>ConfigMaps & Secrets</label></div>
    <div class="topic"><input type="checkbox"><label>Namespaces</label></div>
    <div class="topic"><input type="checkbox"><label>Helm Charts</label></div>
  </div>

  <!-- Terraform -->
  <div class="category">
    <h2>Terraform</h2>
    <div class="topic"><input type="checkbox"><label>Providers</label></div>
    <div class="topic"><input type="checkbox"><label>Resources</label></div>
    <div class="topic"><input type="checkbox"><label>Variables</label></div>
    <div class="topic"><input type="checkbox"><label>Outputs</label></div>
    <div class="topic"><input type="checkbox"><label>terraform init/plan/apply</label></div>
    <div class="topic"><input type="checkbox"><label>terraform fmt</label></div>
    <div class="topic"><input type="checkbox"><label>State File</label></div>
  </div>

  <!-- Monitoring -->
  <div class="category">
    <h2>Monitoring & Logging</h2>
    <div class="topic"><input type="checkbox"><label>Prometheus Installation</label></div>
    <div class="topic"><input type="checkbox"><label>Grafana Dashboards</label></div>
    <div class="topic"><input type="checkbox"><label>Alert Manager</label></div>
  </div>

  <!-- Other Tools -->
  <div class="category">
    <h2>Other Important Tools</h2>
    <div class="topic"><input type="checkbox"><label>Ansible</label></div>
    <div class="topic"><input type="checkbox"><label>SonarQube</label></div>
    <div class="topic"><input type="checkbox"><label>JFrog Artifactory</label></div>
    <div class="topic"><input type="checkbox"><label>Azure Basics</label></div>
    <div class="topic"><input type="checkbox"><label>GitLab</label></div>
    <div class="topic"><input type="checkbox"><label>GitOps with ArgoCD</label></div>
    <div class="topic"><input type="checkbox"><label>Python for DevOps</label></div>
    <div class="topic"><input type="checkbox"><label>Shell Scripting Advanced</label></div>
  </div>

  <footer>
    DevOps Mastery Tracker
  </footer>

  <script>
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    const progressBar = document.getElementById('progressBar');
    const completedCount = document.getElementById('completedCount');
    const totalCount = document.getElementById('totalCount');

    totalCount.innerText = checkboxes.length;

    function updateProgress() {
      let completed = 0;

      checkboxes.forEach((checkbox) => {
        const label = checkbox.nextElementSibling;

        if (checkbox.checked) {
          completed++;
          label.classList.add('completed');
        } else {
          label.classList.remove('completed');
        }
      });

      const percentage = Math.round((completed / checkboxes.length) * 100);

      progressBar.style.width = percentage + '%';
      progressBar.innerText = percentage + '%';
      completedCount.innerText = completed;

      localStorage.setItem('devopsProgress', JSON.stringify(
        Array.from(checkboxes).map(cb => cb.checked)
      ));
    }

    const savedState = JSON.parse(localStorage.getItem('devopsProgress'));

    if (savedState) {
      checkboxes.forEach((checkbox, index) => {
        checkbox.checked = savedState[index];
      });
    }

    checkboxes.forEach((checkbox) => {
      checkbox.addEventListener('change', updateProgress);
    });

    updateProgress();
  </script>

</body>
</html>

