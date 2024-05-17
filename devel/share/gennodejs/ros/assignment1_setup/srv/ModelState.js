// Auto-generated. Do not edit!

// (in-package assignment1_setup.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ModelStateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModelStateRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModelStateRequest
    let len;
    let data = new ModelStateRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment1_setup/ModelStateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModelStateRequest(null);
    return resolved;
    }
};

class ModelStateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.location = null;
      this.covariance = null;
      this.success = null;
      this.status_message = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('covariance')) {
        this.covariance = initObj.covariance
      }
      else {
        this.covariance = [];
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('status_message')) {
        this.status_message = initObj.status_message
      }
      else {
        this.status_message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModelStateResponse
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [location]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.location, buffer, bufferOffset);
    // Serialize message field [covariance]
    // Serialize the length for message field [covariance]
    bufferOffset = _serializer.uint32(obj.covariance.length, buffer, bufferOffset);
    obj.covariance.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Vector3.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [status_message]
    bufferOffset = _serializer.string(obj.status_message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModelStateResponse
    let len;
    let data = new ModelStateResponse(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [location]
    data.location = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [covariance]
    // Deserialize array length for message field [covariance]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.covariance = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.covariance[i] = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [status_message]
    data.status_message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 24 * object.covariance.length;
    length += _getByteLength(object.status_message);
    return length + 33;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment1_setup/ModelStateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '62bdec03e9c27985cd2c0808e297c5db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header                        # Standard metadata for higher-level stamped data types.
                                         # * header.seq holds the number of requests since the plugin started
                                         # * header.stamp timestamp related to the pose
                                         # * header.frame_id not used but currently filled with the relative_entity_name
    geometry_msgs/Point location         # The position of the robot
    geometry_msgs/Vector3[] covariance   # The covariance matrix [[XX, XY, XZ], [YX, YY, YZ], [ZX, ZY, ZZ]]
    bool success                         # return true if successful
    string status_message                # comments if available
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModelStateResponse(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.location !== undefined) {
      resolved.location = geometry_msgs.msg.Point.Resolve(msg.location)
    }
    else {
      resolved.location = new geometry_msgs.msg.Point()
    }

    if (msg.covariance !== undefined) {
      resolved.covariance = new Array(msg.covariance.length);
      for (let i = 0; i < resolved.covariance.length; ++i) {
        resolved.covariance[i] = geometry_msgs.msg.Vector3.Resolve(msg.covariance[i]);
      }
    }
    else {
      resolved.covariance = []
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.status_message !== undefined) {
      resolved.status_message = msg.status_message;
    }
    else {
      resolved.status_message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: ModelStateRequest,
  Response: ModelStateResponse,
  md5sum() { return '62bdec03e9c27985cd2c0808e297c5db'; },
  datatype() { return 'assignment1_setup/ModelState'; }
};
