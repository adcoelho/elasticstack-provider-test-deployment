<!-- TABLE OF CONTENTS -->
<!-- <details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details> -->

<!-- ABOUT THE PROJECT -->

## Summary

This is a small project with test resources to be used with the the [Elasticstack terraform provider](https://github.com/elastic/terraform-provider-elasticstack).

> The Elastic Stack provider allows you to manage and configure the Elastic stack (Elasticsearch, Kibana, etc) as code using terraform.

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

Have Kibana and Elasticsearch running **without** the SSL option.

### Installation

Simply `cd` into the root folder and run `terraform init`. This will install the elasticsearch provider(v0.11.13).

### Usage

To see what will be changed:

```
terraform plan
```

To apply the changes:

```
terraform apply
```
