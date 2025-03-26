# Copyright 2025 the LlamaFactory team.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import os

from llamafactory.train.tuner import run_exp

os.environ["WANDB_MODE"] = "offline"


def main():
    try:
        # 分布式训练业务逻辑代码
        run_exp()
        print(f"train pytorch job success, return 1")  # 任务成功打印输出，选填
        os.system("vc -job success")  # 任务正常结束返回，必填
    except Exception as e:
        print(f"An error occurred: {e}, return -1")  # 任务失败打印输出，选填
        os.system("vc -job failed")  # 任务异常报错返回，必填


def _mp_fn(index):
    # For xla_spawn (TPUs)
    run_exp()


if __name__ == "__main__":
    main()
