class WorkflowTask {
  late String _prompt;
  String get prompt => _prompt;

  WorkflowTask(
    String prompt,
  ) {
    _prompt = prompt;
    _prompt = tmp_prompt();
  }

  String tmp_prompt() {
    return '''
      {
        "6": {
          "inputs": {
            "text": [
              "40",
              0
            ],
            "speak_and_recognation": {
              "__value__": [
                false,
                true
              ]
            },
            "clip": [
              "30",
              1
            ]
          },
          "class_type": "CLIPTextEncode",
          "_meta": {
            "title": "CLIP Text Encode (Positive Prompt)"
          }
        },
        "8": {
          "inputs": {
            "samples": [
              "31",
              0
            ],
            "vae": [
              "30",
              2
            ]
          },
          "class_type": "VAEDecode",
          "_meta": {
            "title": "VAE Decode"
          }
        },
        "9": {
          "inputs": {
            "filename_prefix": "ComfyUI",
            "images": [
              "8",
              0
            ]
          },
          "class_type": "SaveImage",
          "_meta": {
            "title": "Save Image"
          }
        },
        "27": {
          "inputs": {
            "width": 1024,
            "height": 1024,
            "batch_size": 1
          },
          "class_type": "EmptySD3LatentImage",
          "_meta": {
            "title": "EmptySD3LatentImage"
          }
        },
        "30": {
          "inputs": {
            "ckpt_name": "FLUX1-schnell-fp8.safetensors"
          },
          "class_type": "CheckpointLoaderSimple",
          "_meta": {
            "title": "Load Checkpoint"
          }
        },
        "31": {
          "inputs": {
            "seed": 605355695954606,
            "steps": 10,
            "cfg": 1,
            "sampler_name": "euler",
            "scheduler": "simple",
            "denoise": 1,
            "model": [
              "30",
              0
            ],
            "positive": [
              "6",
              0
            ],
            "negative": [
              "33",
              0
            ],
            "latent_image": [
              "27",
              0
            ]
          },
          "class_type": "KSampler",
          "_meta": {
            "title": "KSampler"
          }
        },
        "33": {
          "inputs": {
            "text": [
              "41",
              0
            ],
            "speak_and_recognation": {
              "__value__": [
                false,
                true
              ]
            },
            "clip": [
              "30",
              1
            ]
          },
          "class_type": "CLIPTextEncode",
          "_meta": {
            "title": "CLIP Text Encode (Negative Prompt)"
          }
        },
        "38": {
          "inputs": {
            "value": "室内，客厅，沙发，茶几，绿植，电视，地中海风格，现代"
          },
          "class_type": "PrimitiveString",
          "_meta": {
            "title": "String_Input_Positive"
          }
        },
        "39": {
          "inputs": {
            "value": "裸体"
          },
          "class_type": "PrimitiveString",
          "_meta": {
            "title": "String_Input_Negative"
          }
        },
        "40": {
          "inputs": {
            "from_translate": "chinese",
            "to_translate": "english",
            "text": [
              "38",
              0
            ],
            "speak_and_recognation": {
              "__value__": [
                false,
                true
              ]
            }
          },
          "class_type": "ArgosTranslateTextNode",
          "_meta": {
            "title": "Argos Translate Text Node"
          }
        },
        "41": {
          "inputs": {
            "from_translate": "chinese",
            "to_translate": "english",
            "text": [
              "39",
              0
            ],
            "speak_and_recognation": {
              "__value__": [
                false,
                true
              ]
            }
          },
          "class_type": "ArgosTranslateTextNode",
          "_meta": {
            "title": "Argos Translate Text Node"
          }
        }
      }
      ''';
  }
}
