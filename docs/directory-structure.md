# Microsoft Fabric Jumpstart Repository Structure

```
fabric/
├── README.md                    # Main course overview and setup
├── instructor/                  # Instructor-specific materials
│   ├── lesson-plan.md          # Detailed 4-hour lesson plan
│   ├── timing-guide.md         # Minute-by-minute timing with buffer notes
│   ├── quick-ref.md           # Key commands, links, and troubleshooting
│   └── teaching-notes/         # Segment-specific teaching notes
│       ├── 01-intro.md        # Introduction segment notes
│       ├── 02-lakehouse.md    # Lakehouse segment notes
│       ├── 03-realtime.md     # Real-time segment notes
│       ├── 04-datascience.md  # Data science segment notes
│       └── 05-delivery.md     # Delivery segment notes
│
├── labs/                       # Hands-on lab materials
│   ├── setup/                 # Initial setup instructions
│   │   ├── prerequisites.md   # Prerequisites checklist
│   │   └── environment.md     # Environment setup guide
│   │
│   ├── 01-intro/             # Introduction labs
│   │   ├── workspace-setup.md
│   │   └── onelake-demo.md
│   │
│   ├── 02-lakehouse/         # Lakehouse labs
│   │   ├── medallion-setup.md
│   │   ├── data-ingestion.md
│   │   └── transformation.md
│   │
│   ├── 03-realtime/          # Real-time labs
│   │   ├── event-stream.md
│   │   └── iot-monitoring.md
│   │
│   ├── 04-datascience/       # Data science labs
│   │   ├── ml-workflow.md
│   │   └── forecasting.md
│   │
│   └── 05-delivery/          # Delivery labs
│       ├── powerbi-setup.md
│       └── governance.md
│
├── demos/                     # Pre-built demos
│   ├── 01-intro/             # Introduction demos
│   │   ├── fabric-tour.md
│   │   └── component-demo.md
│   │
│   ├── 02-lakehouse/         # Lakehouse demos
│   │   ├── medallion-demo.md
│   │   └── pipeline-demo.md
│   │
│   ├── 03-realtime/          # Real-time demos
│   │   ├── stream-demo.md
│   │   └── kql-demo.md
│   │
│   ├── 04-datascience/       # Data science demos
│   │   ├── notebook-demo.md
│   │   └── mlflow-demo.md
│   │
│   └── 05-delivery/          # Delivery demos
│       ├── powerbi-demo.md
│       └── governance-demo.md
│
├── assets/                    # Course assets
│   ├── images/               # Course images and diagrams
│   ├── datasets/             # Sample datasets
│   │   ├── contoso-sales.csv
│   │   └── iot-sensors.json
│   └── templates/            # Reusable templates
│       ├── notebook.ipynb
│       └── pipeline.json
│
└── .github/                   # GitHub-specific files
    └── workflows/            # GitHub Actions workflows
        └── validate-links.yml
```

## Key Design Principles

1. **Instructor-First Navigation**
   - `instructor/` directory contains everything needed for teaching
   - Teaching notes are organized by segment with clear numbering
   - Quick reference materials are easily accessible

2. **Clear Lab Organization**
   - Labs follow the same numbering as segments
   - Each lab has its own directory with clear naming
   - Setup instructions are separate from lab content

3. **Demo Separation**
   - Demos are pre-built and ready to go
   - Organized by segment for easy access
   - Include both setup and execution steps

4. **Asset Management**
   - All course assets in one place
   - Sample datasets ready for labs
   - Reusable templates for common tasks

5. **Teaching Support**
   - Timing guide helps stay on schedule
   - Quick reference for common issues
   - Segment-specific teaching notes

## Usage During Live Teaching

1. **Before Class**
   - Review `instructor/timing-guide.md`
   - Check `instructor/quick-ref.md` for any updates
   - Prepare demos from `demos/` directory

2. **During Class**
   - Follow `instructor/lesson-plan.md`
   - Use segment-specific notes from `instructor/teaching-notes/`
   - Reference demos from `demos/` directory
   - Guide students through labs from `labs/` directory

3. **Troubleshooting**
   - Check `instructor/quick-ref.md` for common issues
   - Use pre-built demos as fallback
   - Reference timing guide to stay on track

## File Naming Conventions

- Use clear, descriptive names
- Prefix with segment number (01-, 02-, etc.)
- Use hyphens for spaces
- Include file type extension
- Keep names short but meaningful

## Maintenance

- Keep teaching notes updated with each delivery
- Add new demos as needed
- Update quick reference with common issues
- Maintain timing guide based on actual delivery 