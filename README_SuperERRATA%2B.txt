
# README: SuperERRATA+ Stable Build

**Version**: SuperERRATA+  
**Description**: SuperERRATA+ is an innovative ASCII-style game designed around modular, channel-based gameplay. It combines emergent storytelling, evocative design, and player-driven dynamics to create a unique and engaging experience.

## Key Features
1. **Channel System**:
   - A modular system allowing multiple scripts to run as discrete "channels" that can be dynamically switched.
   - Each channel provides unique visual or interactive elements.

2. **Implemented Channels**:
   - **ChannelStatic.gd**: Displays randomized static patterns.
   - **ChannelBeach.gd**: A scrolling beach scene for ambient visuals.
   - **ChannelScrollingText.gd**: Displays scrolling expository text with a flavor of narrative storytelling.
   - **ChannelScionSelection.gd**: A scion selector featuring 30 scions, their stats, names, and representative symbols, allowing users to assemble their team.
   - **ChannelExodus.gd**: An emergent interaction scene where scions move and create evocative content using data from `SCIONS.gd`.

3. **Scion System**:
   - Powered by `SCIONS.gd`, this system defines the 30 scions with unique stats and symbolic representations. Scions interact dynamically in the **Exodus Channel** to generate new content.

---

## Major Scripts
### **SuperERRATA+.gd**
- **Role**: Core driver script for the game. Manages screen dimensions, channel states, and scion selection mechanics.
- **Key Variables**:
  - `SCREEN_WIDTH`, `SCREEN_HEIGHT`: Define ASCII grid dimensions.
  - `channel_scripts`: Preloads all available channel scripts.
  - `selected_scions`: Stores the player's team of up to 10 scions.
- **Dependencies**:
  - Requires all channel scripts (see list below).
  - Interfaces with `SCIONS.gd` for scion data.

### **ChannelStatic.gd**
- **Role**: Creates a randomized static pattern as a visual channel.

### **ChannelBeach.gd**
- **Role**: Renders a scrolling beach scene, adding a serene aesthetic.

### **ChannelScrollingText.gd**
- **Role**: Displays scrolling text to provide flavor and narrative exposition.

### **ChannelScionSelection.gd**
- **Role**: Provides an interactive selector for scions, showcasing their stats and symbolic representation.

### **ChannelExodus.gd**
- **Role**: Facilitates emergent scion interactions, drawing data from `SCIONS.gd` to generate new channels.

### **SCIONS.gd**
- **Role**: Defines the 30 scions as an array of dictionaries, including:
  - **Name**: Identifier for the scion.
  - **Symbol**: A unique character representing the scion.
  - **Stats**: Attributes such as power, imagination, agility, acuity, mutability, and otherness.

---

## Setup and Execution
1. **Prerequisites**:
   - Godot Engine 4.x.
   - Compatible machine (e.g., Apple Pro Max M4).

2. **Setup**:
   - Ensure all scripts are located in the appropriate directories (`res://`).
   - Open `SuperERRATA+.gd` as the main scene in Godot.

3. **Execution**:
   - Run `SuperERRATA+.gd` in Godot to start the game.
   - Use the controls provided to switch between channels and interact with scions.

---

## Design Philosophy
SuperERRATA+ emphasizes modular, elegant, and emergent design. Each script is crafted to stand independently while contributing to the whole system. The iterative, modular approach ensures stability, maintainability, and scalability.

## Collaboration Notes
- **Best Practices**:
  - Keep commits atomic and descriptive.
  - Use GitHub Issues to track bugs and enhancements.
  - Maintain a consistent code style (documented in the `.editorconfig` file, if present).
- **Iterative Development**:
  - Refine each module in isolation before integration.

---

