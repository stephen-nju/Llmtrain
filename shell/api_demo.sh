
#!/bin/bash

CUDA_VISIBLE_DEVICES=0 API_PORT=8810 API_MODEL_NAME="magiclm-3B" python src/api.py \
    --model_name_or_path /opt/nas/p/zhubin/DATA/models/honor2_5b_patched_tokenizer \
    --adapter_name_or_path /opt/nas/n/zhubin/saved_checkpoint/0103_magiclm_nano_dpo_rnds_markdownv1_ep3_lr1e6_bs4/checkpoint-1000 \
    --template honor \
    --finetuning_type lora
