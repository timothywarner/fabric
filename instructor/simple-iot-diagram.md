# Simplified IoT to Lakehouse Diagram

This simplified diagram shows the Raspberry Pi IoT data flow to Lakehouse and reporting, with minimal styling for maximum compatibility with mermaidchart.com.

```mermaid
graph LR
    A[Raspberry Pi IoT Simulator] -->|Generate Telemetry| B[IoT Hub]
    B -->|Route Events| C[Stream Analytics]
    C -->|Process Stream| D[Event Hub]
    D -->|Real-time Processing| E[KQL Database]
    E -->|Visualize| F[Real-time Dashboard]
    
    C -->|Store Processed Data| G[Data Lake]
    G -->|Load| H[Data Factory ELT Pipeline]
    H -->|Transform| I[Lakehouse Bronze]
    I -->|Clean| J[Lakehouse Silver]
    J -->|Aggregate| K[Lakehouse Gold]
    K -->|Analyze| L[Power BI Report]
```

## Alternative Version with Minimal Styling

```mermaid
graph LR
    A([Raspberry Pi]) --> B([IoT Hub])
    B --> C([Stream Analytics])
    C --> D([Event Hub])
    D --> E([KQL Database])
    E --> F([Dashboard])
    
    C --> G([Data Lake])
    G --> H([Data Factory])
    H --> I([Bronze])
    I --> J([Silver])
    J --> K([Gold])
    K --> L([Reports])
    
    style A fill:#f9d5e5
    style B fill:#eeac99
    style C fill:#e06377
    style D fill:#eeac99
    style E fill:#00a8e8
    style F fill:#5b9aa0
    style G fill:#00a8e8
    style H fill:#e06377
    style I fill:#d8a47f
    style J fill:#e06377
    style K fill:#c83349
    style L fill:#5b9aa0
```

## Text-only Version for Maximum Compatibility

```mermaid
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