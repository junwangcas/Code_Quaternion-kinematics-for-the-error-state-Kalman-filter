//
// Created by junwangcas on 2022/8/27.
//

#ifndef BEGINNER_TUTORIALS_QUATERNION_TEST_CHAPTERS_H
#define BEGINNER_TUTORIALS_QUATERNION_TEST_CHAPTERS_H
#include <iostream>
#include <vector>
#include "eigen3/Eigen/Core"
#include "eigen3/Eigen/Geometry"


class QuaternionTestChapters {
public:
    QuaternionTestChapters();
    ~QuaternionTestChapters();

public:
    void Chapter12();

private:
    void PrintQuat(const Eigen::Quaterniond &q);
    void PrintSection(const std::string chapter, const std::string section);
    Eigen::Quaterniond GetQuat30();

};


#endif //BEGINNER_TUTORIALS_QUATERNION_TEST_CHAPTERS_H
