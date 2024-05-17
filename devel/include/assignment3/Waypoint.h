// Generated by gencpp from file assignment3/Waypoint.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT3_MESSAGE_WAYPOINT_H
#define ASSIGNMENT3_MESSAGE_WAYPOINT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace assignment3
{
template <class ContainerAllocator>
struct Waypoint_
{
  typedef Waypoint_<ContainerAllocator> Type;

  Waypoint_()
    : position()  {
    }
  Waypoint_(const ContainerAllocator& _alloc)
    : position(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _position_type;
  _position_type position;





  typedef boost::shared_ptr< ::assignment3::Waypoint_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment3::Waypoint_<ContainerAllocator> const> ConstPtr;

}; // struct Waypoint_

typedef ::assignment3::Waypoint_<std::allocator<void> > Waypoint;

typedef boost::shared_ptr< ::assignment3::Waypoint > WaypointPtr;
typedef boost::shared_ptr< ::assignment3::Waypoint const> WaypointConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment3::Waypoint_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment3::Waypoint_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignment3::Waypoint_<ContainerAllocator1> & lhs, const ::assignment3::Waypoint_<ContainerAllocator2> & rhs)
{
  return lhs.position == rhs.position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignment3::Waypoint_<ContainerAllocator1> & lhs, const ::assignment3::Waypoint_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignment3

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::assignment3::Waypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment3::Waypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment3::Waypoint_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment3::Waypoint_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment3::Waypoint_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment3::Waypoint_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment3::Waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e7bb0ef028c744b081acdc57743b11d8";
  }

  static const char* value(const ::assignment3::Waypoint_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe7bb0ef028c744b0ULL;
  static const uint64_t static_value2 = 0x81acdc57743b11d8ULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment3::Waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment3/Waypoint";
  }

  static const char* value(const ::assignment3::Waypoint_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment3::Waypoint_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point position\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::assignment3::Waypoint_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment3::Waypoint_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Waypoint_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment3::Waypoint_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment3::Waypoint_<ContainerAllocator>& v)
  {
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT3_MESSAGE_WAYPOINT_H
