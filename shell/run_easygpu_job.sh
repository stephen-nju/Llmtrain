exec >/opt/nas/p/zhubin/easyjobLog/pytorch.log
echo "hoststr==${hoststr}"
echo "pwd==$(pwd)"
echo $hoststr | sed 's/,/\n/g' >/opt/nas/p/zhubin/code/Llmtrain/cache/hostfile
export HF_HOME=/opt/local/data/
vc -proxy open
# 配置wandb
# export WANDB_API_KEY=04c30ea6f4b2e78a13aa48f65ddeff512213be6c
# export WANDB_MODE=offline
# wandb offline
# ./magiclmnano_sft.sh --do_train --do_eval --stage sft --hostfile /opt/nas/p/zhubin/code/Llmtrain/cache/hostfile \
# 	--finetuning_type lora --lora_rank 32 --lora_alpha 1 --lora_target wqkv,w1,w2,w3 --loraplus_lr_ratio 16 \
# 	--max_samples 100 --batch_size 2 \
# 	--name=TEST --dataset baichuan_multiturn_demo \
# 	--gradient_accumulation_steps 1 --cutoff_len=4096 --epochs=3 --lr=1e-4 --save_strategy=epoch --warmup_ratio 0.03 --save_total_limit=3 --eval_dataset \
# 	union_conversations_v5_dev --eval_strategy=steps --eval_steps=300

# ./llmtrain.sh --do_train --do_eval --stage sft --finetuning_type lora --template glm-edge --lora_rank 32 --lora_target q_proj,k_proj,v_proj --loraplus_lr_ratio 16 \
# 	--name=20150121_glm4edge_acfvculdu_loraplus16_ep3_lr5e4_bs4 \
# 	--model_name_or_path /opt/nas/n/zhubin/DATA/models/THUDM/glm-edge-4b-chat/ \
# 	--dataset alpace_gpt4_zh_retain,COIG_PC_core_summary_part,firefly_summary_part,vcsum_headlines,csds_dialogue,union_conversations_v5_norm_markdown,liantong_conversations_v1_markdown,diting_v1_markdown,union_conversations_v4_ll_markdown \
# 	--gradient_accumulation_steps=4 --cutoff_len=4096 --epochs=3 --lr=5e-4 --save_strategy=epoch --warmup_ratio 0.1 --save_total_limit=10 \
# 	--eval_dataset union_conversations_v5_dev --eval_strategy=steps --eval_steps=300 \
# 	--hostfile /opt/nas/p/zhubin/code/Llmtrain/cache/hostfile
