{
  "cwlVersion" : "v1.0",
  "inputs" : [ {
    "id" : "TARBZFILE",
    "type" : "File"
  }, {
    "id" : "UNZIPPEDFILENAME",
    "default" : "temp.tarbz.out",
    "type" : "string"
  }, {
    "id" : "stdoutflag",
    "type" : "string"
  }, {
    "id" : "bowtie2db",
    "type" : "string"
  }, {
    "id" : "bowtie2exe",
    "type" : "string"
  }, {
    "id" : "bt2",
    "type" : "string"
  }, {
    "id" : "inputtype",
    "type" : "string"
  }, {
    "id" : "bowtie2out",
    "type" : "string"
  }, {
    "id" : "OUTFILENAME",
    "type" : "string"
  }, {
    "id" : "profOut",
    "type" : "string"
  }, {
    "id" : "TREENAME",
    "type" : "string"
  }, {
    "id" : "ANNOTNAME",
    "type" : "string"
  }, {
    "id" : "ANNOTOUTNAME",
    "type" : "string"
  }, {
    "id" : "dpi",
    "type" : "int"
  }, {
    "id" : "PNGFILE",
    "type" : "string"
  } ],
  "outputs" : [ {
    "id" : "graphlanoutput",
    "type" : "File",
    "outputSource" : "graphlan/graphlanOut"
  } ],
  "hints" : [ ],
  "requirements" : [ ],
  "successCodes" : [ ],
  "steps" : [ {
    "id" : "untar",
    "run" : {
      "cwlVersion" : "v1.0",
      "inputs" : [ {
        "id" : "fastq",
        "type" : "File",
        "inputBinding" : {
          "position" : 1
        }
      }, {
        "id" : "unzippedFileName",
        "type" : "string"
      }, {
        "id" : "stdoutflag",
        "type" : "string",
        "inputBinding" : {
          "position" : 2
        }
      } ],
      "outputs" : [ {
        "id" : "unzippedFile",
        "type" : "File",
        "outputBinding" : {
          "glob" : "random_stdout_6b48bfbc-d587-48b2-bea8-7f4f9fdd6b12"
        }
      } ],
      "hints" : [ {
        "class" : "DockerRequirement",
        "dockerPull" : "stevetsa/metaphlan:2"
      } ],
      "requirements" : [ ],
      "successCodes" : [ ],
      "stdout" : "$(inputs.unzippedFileName)",
      "baseCommand" : [ "tar", "xjf" ],
      "arguments" : [ ],
      "class" : "CommandLineTool"
    },
    "in" : [ {
      "id" : "fastq",
      "source" : "TARBZFILE"
    }, {
      "id" : "unzippedFileName",
      "source" : "UNZIPPEDFILENAME"
    }, {
      "id" : "stdoutflag",
      "source" : "stdoutflag"
    } ],
    "out" : [ {
      "id" : "unzippedFile"
    } ],
    "hints" : [ ],
    "requirements" : [ ]
  }, {
    "id" : "profile",
    "run" : {
      "cwlVersion" : "v1.0",
      "inputs" : [ {
        "id" : "fileToSearch",
        "type" : "stdin"
      }, {
        "id" : "bowtie2db",
        "type" : "string",
        "inputBinding" : {
          "position" : 1,
          "prefix" : "--bowtie2db"
        }
      }, {
        "id" : "bowtie2exe",
        "type" : "string",
        "inputBinding" : {
          "position" : 2,
          "prefix" : "--bowtie2_exe"
        }
      }, {
        "id" : "bt2",
        "type" : "string",
        "inputBinding" : {
          "position" : 3,
          "prefix" : "--bt2_ps"
        }
      }, {
        "id" : "inputtype",
        "type" : "string",
        "inputBinding" : {
          "position" : 4,
          "prefix" : "--input_type"
        }
      }, {
        "id" : "bowtie2out",
        "type" : "string",
        "inputBinding" : {
          "position" : 5,
          "prefix" : "--bowtie2out"
        }
      }, {
        "id" : "outFileName",
        "type" : "string"
      } ],
      "outputs" : [ {
        "id" : "profileOut",
        "type" : "File",
        "outputBinding" : {
          "glob" : "random_stdout_ad3740ca-23fd-4520-b815-39ef4a384e16"
        }
      } ],
      "hints" : [ {
        "class" : "DockerRequirement",
        "dockerPull" : "stevetsa/metaphlan:2"
      } ],
      "requirements" : [ ],
      "successCodes" : [ ],
      "stdout" : "$(inputs.outFileName)",
      "baseCommand" : "/metaphlan/metaphlan.py",
      "arguments" : [ ],
      "class" : "CommandLineTool"
    },
    "in" : [ {
      "id" : "fileToSearch",
      "source" : "untar/unzippedFile"
    }, {
      "id" : "bowtie2db",
      "source" : "bowtie2db"
    }, {
      "id" : "bowtie2exe",
      "source" : "bowtie2exe"
    }, {
      "id" : "bt2",
      "source" : "bt2"
    }, {
      "id" : "inputtype",
      "source" : "inputtype"
    }, {
      "id" : "bowtie2out",
      "source" : "bowtie2out"
    }, {
      "id" : "outFileName",
      "source" : "OUTFILENAME"
    } ],
    "out" : [ {
      "id" : "profileOut"
    } ],
    "hints" : [ ],
    "requirements" : [ ]
  }, {
    "id" : "meta2graph",
    "run" : {
      "cwlVersion" : "v1.0",
      "inputs" : [ {
        "id" : "profOut",
        "type" : "File",
        "inputBinding" : {
          "position" : 1
        }
      }, {
        "id" : "treefile",
        "type" : "string",
        "inputBinding" : {
          "position" : 2,
          "prefix" : "--tree_file"
        }
      }, {
        "id" : "annotfile",
        "type" : "string",
        "inputBinding" : {
          "position" : 3,
          "prefix" : "--annot_file"
        }
      } ],
      "outputs" : [ {
        "id" : "TreeOut",
        "type" : "File",
        "outputBinding" : {
          "glob" : "*.tree.txt"
        }
      }, {
        "id" : "AnnotOut",
        "type" : "File",
        "outputBinding" : {
          "glob" : "*.annot.txt"
        }
      } ],
      "hints" : [ {
        "class" : "DockerRequirement",
        "dockerPull" : "stevetsa/metaphlan:2"
      } ],
      "requirements" : [ ],
      "successCodes" : [ ],
      "baseCommand" : "/metaphlan/plotting_scripts/metaphlan2graphlan.py",
      "arguments" : [ ],
      "class" : "CommandLineTool"
    },
    "in" : [ {
      "id" : "profOut",
      "source" : "profile/profileOut"
    }, {
      "id" : "treefile",
      "source" : "TREENAME"
    }, {
      "id" : "annotfile",
      "source" : "ANNOTNAME"
    } ],
    "out" : [ {
      "id" : "TreeOut"
    }, {
      "id" : "AnnotOut"
    } ],
    "hints" : [ ],
    "requirements" : [ ]
  }, {
    "id" : "annotate",
    "run" : {
      "cwlVersion" : "v1.0",
      "inputs" : [ {
        "id" : "annotfile2",
        "type" : "File",
        "inputBinding" : {
          "position" : 1,
          "prefix" : "--annot"
        }
      }, {
        "id" : "treefile2",
        "type" : "File",
        "inputBinding" : {
          "position" : 2
        }
      }, {
        "id" : "annotOutName",
        "type" : "string",
        "inputBinding" : {
          "position" : 3
        }
      } ],
      "outputs" : [ {
        "id" : "annotateOut",
        "type" : "File",
        "outputBinding" : {
          "glob" : "*.xml"
        }
      } ],
      "hints" : [ {
        "class" : "DockerRequirement",
        "dockerPull" : "stevetsa/metaphlan:2"
      } ],
      "requirements" : [ ],
      "successCodes" : [ ],
      "baseCommand" : "/graphlan/graphlan_annotate.py",
      "arguments" : [ ],
      "class" : "CommandLineTool"
    },
    "in" : [ {
      "id" : "annotfile2",
      "source" : "meta2graph/AnnotOut"
    }, {
      "id" : "treefile2",
      "source" : "meta2graph/TreeOut"
    }, {
      "id" : "annotOutName",
      "source" : "ANNOTOUTNAME"
    } ],
    "out" : [ {
      "id" : "annotateOut"
    } ],
    "hints" : [ ],
    "requirements" : [ ]
  }, {
    "id" : "graphlan",
    "run" : {
      "cwlVersion" : "v1.0",
      "inputs" : [ {
        "id" : "dpi",
        "type" : "int",
        "inputBinding" : {
          "position" : 1,
          "prefix" : "--dpi"
        }
      }, {
        "id" : "xmlfile",
        "type" : "File",
        "inputBinding" : {
          "position" : 2
        }
      }, {
        "id" : "pngfile",
        "type" : "string",
        "inputBinding" : {
          "position" : 3
        }
      } ],
      "outputs" : [ {
        "id" : "graphlanOut",
        "type" : "File",
        "outputBinding" : {
          "glob" : "*.png"
        }
      } ],
      "hints" : [ {
        "class" : "DockerRequirement",
        "dockerPull" : "stevetsa/metaphlan:2"
      } ],
      "requirements" : [ ],
      "successCodes" : [ ],
      "baseCommand" : "/graphlan/graphlan.py",
      "arguments" : [ ],
      "class" : "CommandLineTool"
    },
    "in" : [ {
      "id" : "dpi",
      "source" : "dpi"
    }, {
      "id" : "xmlfile",
      "source" : "annotate/annotateOut"
    }, {
      "id" : "pngfile",
      "source" : "PNGFILE"
    } ],
    "out" : [ {
      "id" : "graphlanOut"
    } ],
    "hints" : [ ],
    "requirements" : [ ]
  } ],
  "dct:creator" : {
    "@id" : "NA",
    "foaf:mbox" : "mailto:mylagimail2004@yahoo.com",
    "foaf:name" : "Steve Tsang"
  },
  "doc" : "See the [Metaphlan](https://bitbucket.org/biobakery/metaphlan2) website for more information.\n",
  "id" : "metaphlan_wfl",
  "label" : "metaphlan",
  "class" : "Workflow"
}
