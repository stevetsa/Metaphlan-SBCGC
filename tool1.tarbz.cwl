cwlVersion: v1.0
class: CommandLineTool
baseCommand: [tar, xjf]
stdout: $(inputs.unzippedFileName)
hints:
  - class: DockerRequirement
    dockerPull: stevetsa/metaphlan:2  
inputs:
  fastq:
    type: File
    inputBinding:
      position: 1
  unzippedFileName:
    type: string
  stdoutflag:
    type: string
    inputBinding: 
      position: 2
outputs:
  unzippedFile:
    type: stdout
