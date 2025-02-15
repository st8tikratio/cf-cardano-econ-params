### Cardano Economic Parameter Insights ⚖️

<p align="left">
<img alt="Release" src="https://github.com/your-username/cardano-economic-parameter-insights/actions/workflows/release.yaml/badge.svg?branch=main" />
<a href="https://opensource.org/licenses/MPL-2.0"><img alt="License" src="https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg" /></a>

This repository provides a comprehensive analysis of *Cardano's economic parameters* and their impact on governance, staking incentives, and monetary policy. It includes a whitepaper by Professor Massimo Morini, which explores the interplay between key parameters such as *pledge influence*, *desired pool size*, and *monetary expansion*. The goal is to foster a deeper understanding of Cardano's tokenomics and provide tools for the community to make informed governance decisions.

## 📄 Whitepaper

The whitepaper, authored by Professor Massimo Morini, is available in both LaTeX and Markdown formats. It provides a detailed analysis of:

- **Staking Incentives**: The effects of parameters like `k` (desired number of pools) and `a₀` (pledge influence) on pool rewards.
- **Economic Dynamics**: The interaction between reserves, rewards, and treasury growth, and how they deviate from simplified models.
- **Pool Distribution**: Insights into the distribution of stake and pledge across pools and its impact on decentralization.
- **Mathematical Modeling**: A mathematical framework for understanding and projecting Cardano's economic behavior.

The whitepaper can be found in the `latex/` folder as [`whitepaper.pdf`](./latex/whitepaper.pdf) or in Markdown format as [`whitepaper.md`](./whitepaper.md).

## 📊 Features

This repository includes:

- **Figures and Visualizations**: A collection of charts and graphs illustrating the effects of economic parameters on rewards, reserves, and treasury growth. These are located in the `figures/` folder.
- **LaTeX and Markdown Support**: The whitepaper is maintained in LaTeX for high-quality typesetting and converted to Markdown for accessibility.
- **Automation Scripts**: Tools for converting LaTeX to Markdown and replacing `.eps` figures with `.png` for compatibility.

## 🚀 Getting Started

If you want to edit or contribute to the whitepaper, follow these steps:

1. Clone the repository:
   ```zsh
   git clone https://github.com/your-username/cardano-economic-parameter-insights.git
   cd cardano-economic-parameter-insights
   ```

2. Edit the whitepaper:
   - Modify the LaTeX source files in the `latex/` folder.
   - Update the figures in the `figures/` folder as needed.
   - *Hint*: VS Code with the LaTeX Workshop extension is recommended for editing LaTeX files.

3. Generate Markdown from LaTeX:
   Use the provided script to convert the LaTeX whitepaper to Markdown:
   ```zsh
   cd scripts
   sh latex-to-markdown.sh
   ```

## 📦 Repository Structure

- **`latex/`**: Contains the LaTeX source files for the whitepaper, including the bibliography and compiled PDF.
- **`figures/`**: Includes all figures used in the whitepaper, in `.eps`, `.png`, and `.pdf` formats.
- **`scripts/`**: Automation scripts for converting LaTeX to Markdown and managing figure formats.

## 🧪 Key Insights

The whitepaper provides several important findings:

- **Staking Incentives**: Smaller pools face challenges in increasing rewards through pledge, while larger pools benefit more significantly. This has implications for decentralization and inclusivity.
- **Monetary Policy**: The actual release of reserves is lower than the theoretical rate due to adjustments for pool performance and active stake. Rewards are distributed unevenly between treasury and staking rewards.
- **Pool Distribution**: Stake and pledge are concentrated in larger pools, which impacts the effectiveness of decentralization incentives.
- **Mathematical Modeling**: The whitepaper introduces stochastic models for projecting the long-term behavior of reserves and rewards.
