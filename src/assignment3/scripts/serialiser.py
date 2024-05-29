import json
import numpy as np
import torch
from assignment3.msg import SerialisedDict

def tensor_to_bytes(tensor):
        return tensor.numpy().astype(np.float32).tobytes()

def dict_to_policy_bytes(policy):
    return SerialisedDict(
        log_std=tensor_to_bytes(policy['log_std']),
        log_std_shape=policy['log_std'].shape,
        mlp_extractor_policy_net_0_weight=tensor_to_bytes(policy['mlp_extractor.policy_net.0.weight']),
        mlp_extractor_policy_net_0_weight_shape=policy['mlp_extractor.policy_net.0.weight'].shape,
        mlp_extractor_policy_net_0_bias=tensor_to_bytes(policy['mlp_extractor.policy_net.0.bias']),
        mlp_extractor_policy_net_0_bias_shape=policy['mlp_extractor.policy_net.0.bias'].shape,
        mlp_extractor_policy_net_2_weight=tensor_to_bytes(policy['mlp_extractor.policy_net.2.weight']),
        mlp_extractor_policy_net_2_weight_shape=policy['mlp_extractor.policy_net.2.weight'].shape,
        mlp_extractor_policy_net_2_bias=tensor_to_bytes(policy['mlp_extractor.policy_net.2.bias']),
        mlp_extractor_policy_net_2_bias_shape=policy['mlp_extractor.policy_net.2.bias'].shape,
        mlp_extractor_value_net_0_weight=tensor_to_bytes(policy['mlp_extractor.value_net.0.weight']),
        mlp_extractor_value_net_0_weight_shape=policy['mlp_extractor.value_net.0.weight'].shape,
        mlp_extractor_value_net_0_bias=tensor_to_bytes(policy['mlp_extractor.value_net.0.bias']),
        mlp_extractor_value_net_0_bias_shape=policy['mlp_extractor.value_net.0.bias'].shape,
        mlp_extractor_value_net_2_weight=tensor_to_bytes(policy['mlp_extractor.value_net.2.weight']),
        mlp_extractor_value_net_2_weight_shape=policy['mlp_extractor.value_net.2.weight'].shape,
        mlp_extractor_value_net_2_bias=tensor_to_bytes(policy['mlp_extractor.value_net.2.bias']),
        mlp_extractor_value_net_2_bias_shape=policy['mlp_extractor.value_net.2.bias'].shape,
        action_net_weight=tensor_to_bytes(policy['action_net.weight']),
        action_net_weight_shape=policy['action_net.weight'].shape,
        action_net_bias=tensor_to_bytes(policy['action_net.bias']),
        action_net_bias_shape=policy['action_net.bias'].shape,
        value_net_weight=tensor_to_bytes(policy['value_net.weight']),
        value_net_weight_shape=policy['value_net.weight'].shape,
        value_net_bias=tensor_to_bytes(policy['value_net.bias']),
        value_net_bias_shape=policy['value_net.bias'].shape
    )

def bytes_to_tensor(bytes_data, shape):
    return torch.from_numpy(np.frombuffer(bytes_data, dtype=np.float32).reshape(shape))

def policy_bytes_to_dict(policy_bytes):
    return {
        'log_std': bytes_to_tensor(policy_bytes.log_std, policy_bytes.log_std_shape),
        'mlp_extractor.policy_net.0.weight': bytes_to_tensor(policy_bytes.mlp_extractor_policy_net_0_weight, policy_bytes.mlp_extractor_policy_net_0_weight_shape),
        'mlp_extractor.policy_net.0.bias': bytes_to_tensor(policy_bytes.mlp_extractor_policy_net_0_bias, policy_bytes.mlp_extractor_policy_net_0_bias_shape),
        'mlp_extractor.policy_net.2.weight': bytes_to_tensor(policy_bytes.mlp_extractor_policy_net_2_weight, policy_bytes.mlp_extractor_policy_net_2_weight_shape),
        'mlp_extractor.policy_net.2.bias': bytes_to_tensor(policy_bytes.mlp_extractor_policy_net_2_bias, policy_bytes.mlp_extractor_policy_net_2_bias_shape),
        'mlp_extractor.value_net.0.weight': bytes_to_tensor(policy_bytes.mlp_extractor_value_net_0_weight, policy_bytes.mlp_extractor_value_net_0_weight_shape),
        'mlp_extractor.value_net.0.bias': bytes_to_tensor(policy_bytes.mlp_extractor_value_net_0_bias, policy_bytes.mlp_extractor_value_net_0_bias_shape),
        'mlp_extractor.value_net.2.weight': bytes_to_tensor(policy_bytes.mlp_extractor_value_net_2_weight, policy_bytes.mlp_extractor_value_net_2_weight_shape),
        'mlp_extractor.value_net.2.bias': bytes_to_tensor(policy_bytes.mlp_extractor_value_net_2_bias, policy_bytes.mlp_extractor_value_net_2_bias_shape),
        'action_net.weight': bytes_to_tensor(policy_bytes.action_net_weight, policy_bytes.action_net_weight_shape),
        'action_net.bias': bytes_to_tensor(policy_bytes.action_net_bias, policy_bytes.action_net_bias_shape),
        'value_net.weight': bytes_to_tensor(policy_bytes.value_net_weight, policy_bytes.value_net_weight_shape),
        'value_net.bias': bytes_to_tensor(policy_bytes.value_net_bias, policy_bytes.value_net_bias_shape)
    }

def average_policy(policy1, policy2):
    # Average the tensors
    averaged_tensors = {key: (policy1[key] + policy2[key]) / 2 for key in policy1}
    
    return averaged_tensors
