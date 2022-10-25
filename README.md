# Squad Finder

![giphy](https://user-images.githubusercontent.com/54329737/197872395-2cd75309-59f2-4058-b95a-c5e6b0b4ee65.gif)

<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#Routes"> ➤ Routes</a></li>
    <li><a href="#Endpoints"> ➤ Endpoints</a></li>
    <li><a href="#Schema"> ➤ Schema</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
 </details>
 
 <!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 5.1.2</li>
  <li>Faraday</li>
  <li>Figaro</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Capybara</li>
  <li>SimpleCov</li>
  <li>JSON API Serializer</li>
  <li>Launchy</li>
  <li>Orderly</li>
  <li>Shoulda-Matchers</li>
  </ul>
  
 <!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>

<ul>
  <li><b>app/controllers</li></b>
  <ol>
  <li>Contains several controllers that is able to make API calls and CRUD users</li></ol>
  <li><b>app/controllers/facade</b></li><ol>
  <li>Facade is a structural design pattern that provides a simplified (but limited) interface to a complex system of classes, library or framework allowing the application to store and call on data </li></ol>
   <li><b>app/services</b>
    <ol>
  <li>Makes API calls via Faraday and exposes endpoints allowing the data to be manipulated </li></ol>
  <li><b>app/poros</b></li><ol>
  <li>Formats API data into Ruby objects and cleans and organizes unwanted data</li></ol>
</ul>

<!-- ROUTES -->
<h2 id="Routes"> :open_file_folder: Routes</h2>

| Rails Routes  |  |  |
| ------------- | ------------- | ------------- |
| root  | welcome#index  | goes to welcome index page  |
| resources  | api/v1/search  | rawg_search  |
| resources  | api/v1/games  | only: [ :show ]  |
| resources  | api/v1/games/users  | only: [ :index ]  |
| resources  | api/v1/squads  | only: [ :create ]  |
| resources  | api/v1/users  | only: [ :index, :show ]  |
| resources  | api/v1/users/games  | only: [ :index, :destroy, :create ]  |
| resources  | api/v1/users/squads  | only: [ :index, :destroy, :create ]  |

  <!-- Endpoints -->
<h2 id="Endpoints"> :book: Endpoints</h2>

### [RAWG API SEARCH](https://rawg.io/apidocs)
* `https://api.rawg.io/api/games?search=Call&genres=Shooter`
* Authorization: You must include an API key with every request. In the following example, replace YOUR_API_KEY with your API key.
* Params: search(info), genres(info),page_size(amount)
<img src="https://rawg.io/assets/images/cover.117cc320ec2800b9b12092ca23d6e86d.png" width=50% height=50%>
  
  <!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/backend-ruby</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/backend-ruby</code></pre>
<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>
<img src="https://user-images.githubusercontent.com/54329737/197885923-31252ac3-e4df-46ca-9d8f-d73cf0957693.png" width=30% height=30%>

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:Squadfinder/backend-ruby.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>7. </b> Inside your project directory, install <a href="https://github.com/laserlemon/figaro"> Figaro</a> via your terminal.</p>
<pre><code>$ bundle exec figaro install</code></pre>

<p><b>8. </b> Install <a href="https://lostisland.github.io/faraday/"> Faraday</a>.</p>
<pre><code>$ bundle exec faraday install</code></pre>

<p><b>9. </b> Add API key to config/applicalion.yml</a>.</p>
<pre><code>$ rawg_api_key: XXXXX</code></pre>

<p><b>10. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

<!-- Schema -->
<h2 id="Schema"> :scroll: Schema</h2>
<img src="https://user-images.githubusercontent.com/54329737/197882806-062a775c-8007-4e13-924e-f87a8a005a6a.png" width=50% height=50%>
<!-- CREDITS -->

<h2 id="credits"> :scroll: Credits</h2>

![giphy (1)](https://user-images.githubusercontent.com/54329737/197885000-6f604823-0c7b-4098-980a-dc082e8ac264.gif)

<h3>Blake Saylor</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/blakesaylor)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/blake-saylor/)
<h3>Wesley Miranda</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/wes30303)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/wesley-miranda-80a725196/)
<h3>Michael Koulouvaris</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/mikekoul)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/michael-koulouvaris/)
<h3>Thomas Turner</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/EagleEye5085)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/thomasturner482/)
