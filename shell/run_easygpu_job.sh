exec >/opt/nas/p/zhubin/easyjobLog/pytorch.log
echo "hoststr==${hoststr}"
echo "pwd==$(pwd)"
echo $hoststr | sed 's/,/\n/g' >/opt/nas/p/zhubin/code/Llmtrain/cache/hostfile
export HF_HOME=/opt/nas/p/zhubin/.cache/huggingface/datasets

./magiclmnano_sft.sh --do_train --do_eval --stage sft --hostfile /opt/nas/p/zhubin/code/Llmtrain/cache/hostfile \
	--finetuning_type lora --lora_rank 32 --lora_alpha 1 --lora_target wqkv,w1,w2,w3 --loraplus_lr_ratio 16 \
	--max_samples 50 \
	--name=0120_magiclm_nano_cusl_loraplus16_ep3_lr1e4_bs4 \
	--dataset baichuan_multiturn_demo \
	--gradient_accumulation_steps 1 --cutoff_len=4096 --epochs=3 --lr=1e-4 --save_strategy=epoch --warmup_ratio 0.03 --save_total_limit=3 --eval_dataset \
	union_conversations_v5_dev --eval_strategy=steps --eval_steps=300
