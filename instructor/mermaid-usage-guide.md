# Using Mermaid Diagrams in Microsoft Fabric Course

This guide explains how to use the Mermaid diagrams provided in this course with both mermaidchart.com and VS Code.

## Viewing Diagrams in VS Code

1. The VS Code Markdown Mermaid extension (`bierner.markdown-mermaid`) is already installed in your environment.
2. Open any of the diagram files in VS Code:
   - `mermaid-diagrams.md` - Contains all diagrams for each course segment
   - `simple-iot-diagram.md` - Contains simplified IoT diagrams
3. Use VS Code's built-in Markdown preview (Ctrl+Shift+V or ⌘+Shift+V on Mac) to see the rendered diagrams.

## Using Diagrams with mermaidchart.com

If you encounter errors when pasting diagrams into mermaidchart.com, follow these steps:

1. Use the simplest version of the diagram (the "Text-only Version" in `simple-iot-diagram.md`).
2. When copying code to mermaidchart.com:
   - Remove all styling classes (classDef and class declarations)
   - Remove all styling attributes
   - Keep the basic graph structure with nodes and edges

### Step-by-Step for mermaidchart.com

1. Go to [mermaidchart.com](https://mermaidchart.com/) and sign in or create an account.
2. Click "New Diagram" to create a new diagram.
3. Delete any template code in the editor.
4. Copy the basic diagram code from the "Text-only Version" section.
5. Paste into the editor.
6. If you encounter errors:
   - Remove any extra spaces or line breaks
   - Ensure each line ends with a proper connection or node definition
   - Try removing node styling (square brackets, parentheses) if needed

### Example of Compatible Code for mermaidchart.com

```
graph LR
    A[Raspberry Pi] --> B[IoT Hub]
    B --> C[Stream Analytics]
    C --> D[Event Hub]
    D --> E[KQL Database]
    E --> F[Dashboard]
    C --> G[Data Lake]
    G --> H[Data Factory]
    H --> I[Bronze Layer]
    I --> J[Silver Layer]
    J --> K[Gold Layer]
    K --> L[Power BI]
```

## Customizing Diagrams in mermaidchart.com

Once your diagram is correctly imported, mermaidchart.com provides a visual editor to:

1. Change node shapes and colors
2. Edit connection styles
3. Add or remove elements
4. Export as SVG, PNG, or embed in other documents

## Troubleshooting

If you experience issues with mermaidchart.com:

1. Start with the simplest diagram version
2. Add features and styling incrementally
3. Check the error messages in the editor for specific syntax issues
4. Consider using the mermaid Live Editor at [mermaid.live](https://mermaid.live/) as an alternative

## Sharing and Exporting

Both mermaidchart.com and VS Code Mermaid preview allow you to:

1. Export diagrams as images (PNG, SVG)
2. Share diagrams via links (mermaidchart.com)
3. Include diagrams in your course materials and presentations 