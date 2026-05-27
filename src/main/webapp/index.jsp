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
      padding: 20px;
      color: #333;
    }

    h1 {
      text-align: center;
      margin-bottom: 10px;
      color: #1e3a8a;
    }

    .subtitle {
      text-align: center;
      margin-bottom: 25px;
      color: #555;
    }

    .summary {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-bottom: 30px;
      flex-wrap: wrap;
    }

    .summary-card {
      background: white;
      padding: 15px 25px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      min-width: 180px;
      text-align: center;
    }

    .summary-card h2 {
      font-size: 28px;
      color: #2563eb;
      margin-bottom: 5px;
    }

    .tracker-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
      gap: 20px;
    }

    .tool-card {
      background: white;
      border-radius: 16px;
      padding: 20px;
      box-shadow: 0 5px 12px rgba(0,0,0,0.08);
      transition: transform 0.2s ease;
    }

    .tool-card:hover {
      transform: translateY(-5px);
    }

    .tool-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }

    .tool-header h2 {
      color: #111827;
      font-size: 22px;
    }

    .progress-text {
      font-size: 14px;
      color: #555;
      margin-bottom: 10px;
    }

    .progress-bar {
      width: 100%;
      height: 12px;
      background: #e5e7eb;
      border-radius: 50px;
      overflow: hidden;
      margin-bottom: 20px;
    }

    .progress-fill {
      height: 100%;
      width: 0%;
      background: linear-gradient(90deg, #3b82f6, #2563eb);
      transition: width 0.3s ease;
    }

    .topic {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
      border-bottom: 1px solid #eee;
      gap: 10px;
    }

    .topic:last-child {
      border-bottom: none;
    }

    .topic-name {
      flex: 1;
      font-size: 15px;
    }

    .status-btn {
      padding: 8px 14px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: bold;
      color: white;
      transition: 0.3s ease;
      min-width: 120px;
    }

    .pending {
      background: #ef4444;
    }

    .completed {
      background: #22c55e;
    }

    .reset-btn {
      margin-top: 15px;
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 10px;
      background: #111827;
      color: white;
      cursor: pointer;
      font-size: 15px;
      font-weight: bold;
    }

    .reset-btn:hover {
      background: #1f2937;
    }

    @media (max-width: 600px) {
      .topic {
        flex-direction: column;
        align-items: flex-start;
      }

      .status-btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>

  <h1>DevOps Learning Tracker</h1>
  <p class="subtitle">Track your DevOps revision, practice, and topic completion status</p>

  <div class="summary">
    <div class="summary-card">
      <h2 id="totalTopics">0</h2>
      <p>Total Topics</p>
    </div>

    <div class="summary-card">
      <h2 id="completedTopics">0</h2>
      <p>Completed</p>
    </div>

    <div class="summary-card">
      <h2 id="overallProgress">0%</h2>
      <p>Overall Progress</p>
    </div>
  </div>

  <div class="tracker-container" id="trackerContainer"></div>

  <script>
    const devopsData = [
      {
        tool: 'Linux',
        topics: [
          'File Permissions',
          'User Management',
          'Process Management',
          'Networking Commands',
          'Shell Scripting'
        ]
      },
      {
        tool: 'Git',
        topics: [
          'Git Init',
          'Git Clone',
          'Git Commit',
          'Git Branching',
          'Git Merge'
        ]
      },
      {
        tool: 'Docker',
        topics: [
          'Docker Images',
          'Docker Containers',
          'Dockerfile',
          'Docker Compose',
          'Docker Volumes'
        ]
      },
      {
        tool: 'Jenkins',
        topics: [
          'Pipeline',
          'Freestyle Job',
          'Agent Node',
          'Webhook',
          'CI/CD Flow'
        ]
      },
      {
        tool: 'Kubernetes',
        topics: [
          'Pods',
          'Deployments',
          'Services',
          'Ingress',
          'ConfigMaps'
        ]
      },
      {
        tool: 'Terraform',
        topics: [
          'Providers',
          'Resources',
          'Variables',
          'State File',
          'Modules'
        ]
      },
      {
        tool: 'AWS',
        topics: [
          'IAM',
          'EC2',
          'S3',
          'VPC',
          'CloudWatch'
        ]
      },
      {
        tool: 'Ansible',
        topics: [
          'Inventory',
          'Playbooks',
          'Roles',
          'Variables',
          'Handlers'
        ]
      }
    ];

    const trackerContainer = document.getElementById('trackerContainer');

    function loadTracker() {
      trackerContainer.innerHTML = '';

      let totalTopics = 0;
      let completedTopics = 0;

      devopsData.forEach((toolData, toolIndex) => {
        const card = document.createElement('div');
        card.className = 'tool-card';

        let topicHTML = '';
        let toolCompleted = 0;

        toolData.topics.forEach((topic, topicIndex) => {
          totalTopics++;

          const storageKey = `tool_${toolIndex}_topic_${topicIndex}`;
          const isCompleted = localStorage.getItem(storageKey) === 'true';

          if (isCompleted) {
            completedTopics++;
            toolCompleted++;
          }

          topicHTML += `
            <div class="topic">
              <div class="topic-name">${topic}</div>
              <button
                class="status-btn ${isCompleted ? 'completed' : 'pending'}"
                onclick="toggleStatus(${toolIndex}, ${topicIndex})">
                ${isCompleted ? 'Completed' : 'Pending'}
              </button>
            </div>
          `;
        });

        const progress = Math.round((toolCompleted / toolData.topics.length) * 100);

        card.innerHTML = `
          <div class="tool-header">
            <h2>${toolData.tool}</h2>
            <span>${progress}%</span>
          </div>

          <div class="progress-text">
            ${toolCompleted} / ${toolData.topics.length} Topics Completed
          </div>

          <div class="progress-bar">
            <div class="progress-fill" style="width:${progress}%"></div>
          </div>

          ${topicHTML}

          <button class="reset-btn" onclick="resetTool(${toolIndex})">
            Reset ${toolData.tool}
          </button>
        `;

        trackerContainer.appendChild(card);
      });

      document.getElementById('totalTopics').innerText = totalTopics;
      document.getElementById('completedTopics').innerText = completedTopics;

      const overall = Math.round((completedTopics / totalTopics) * 100) || 0;
      document.getElementById('overallProgress').innerText = overall + '%';
    }

    function toggleStatus(toolIndex, topicIndex) {
      const storageKey = `tool_${toolIndex}_topic_${topicIndex}`;
      const current = localStorage.getItem(storageKey) === 'true';

      localStorage.setItem(storageKey, !current);
      loadTracker();
    }

    function resetTool(toolIndex) {
      devopsData[toolIndex].topics.forEach((_, topicIndex) => {
        const storageKey = `tool_${toolIndex}_topic_${topicIndex}`;
        localStorage.removeItem(storageKey);
      });

      loadTracker();
    }

    loadTracker();
  </script>

</body>
</html>

