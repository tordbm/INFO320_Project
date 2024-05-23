# INFO320_Project
Related repo: <a>https://github.com/tordbm/INFO320_frontend</a>
### How to run (assumes MacOS)
<ol>
  <li>Download docker desktop</li>
  <li>Pull the ontop/ontop image <code>docker pull ontop/ontop</docker></code></li>
  <li>Make sure npm is installed</li>
  <li>Clone both projects and place them next to each other in the same parent directory</li>
  <li>While in the INFO320_Project directory, run <code> ./run_project.sh </code> </li>
</ol>

If <code>./run_project.sh</code> does not work:
<ol>
  <li>Follow step 1 through 3 above</li>
  <li>Clone both INFO320_frontend and this repository</li>
  <li>Run the .jar file in the h2/bin folder</li>
  <li>Run <code>docker-compose up</code> after docker is running</li>
  <li>Run <code>npm install</code> and <code>npm run dev</code> while in the frontend project</li>
  <li>The site is now hosted on <a>http://localhost:5173/</a></li>
</ol>
