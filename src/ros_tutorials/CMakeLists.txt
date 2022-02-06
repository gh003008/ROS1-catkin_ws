cmake_minimum_required(VERSION 3.0.2)
project(ros_tutorials)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  message_generation
  roscpp
  std_msgs
)

##########Your code here#############
####### 메세지 파일(.msg) 파일, 의존성 추가

## 메시지선언: MsgTutorial.msg
add_message_files(FILES MsgTutorial.msg)
## 의존하는메시지를설정하는옵션이다.
## std_msgs가설치되어있지않다면빌드도중에에러가난다.
generate_messages(DEPENDENCIES std_msgs) # std_msg를 의존성으로 사용하여 msg 파일에 여러 자료형 사용 가능

######################################




## catkin 패키지옵션으로라이브러리, catkin 빌드의존성, 시스템의존패키지를기술한다.
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES ros_tutorials
  CATKIN_DEPENDS geometry_msgs message_generation roscpp std_msgs
  DEPENDS system_lib
)

###########
## Build ##
###########

## 인클루드디렉터리를설정한다.
## Specify additional locations of header files
## Your package locations should be listed before other locations
# 코드 빌드를 위해 사용하는 헤더 파일의 경로를 정의 해줌

include_directories(
# include
  ${catkin_INCLUDE_DIRS}# 앞서 find_package로 불러온 패키지 들에 include dir을 추가하겠다는 의미
)

##########Your code here#############
#executable, target_link_libraries, dependencies 추가 #

## circular_motion_publisher노드에대한빌드옵션이다.
## 실행파일, 타깃링크라이브러리, 추가의존성등을설정한다.

add_executable(circular_motion_publisher src/circular_motion_publisher.cpp)
add_dependencies(circular_motion_publisher ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(circular_motion_publisher ${catkin_LIBRARIES})


#####################################
