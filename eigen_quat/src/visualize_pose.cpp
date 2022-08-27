#include <iostream>
#include <fstream>
#include <vector>
#include "eigen3/Eigen/Core"
#include "eigen3/Eigen/Geometry"



std::vector<std::vector<double>> ReadTxt(const std::string filename) {
    std::vector<std::vector<double>> lines;
    std::ifstream ifs(filename);
    if(!ifs.good())
    {
        std::cout << "ifstream open file error!\n";
        return lines;
    }
    std::string line;

    while(getline(ifs, line))    //获取每一行数据
    {
//        lines.push_back(line);   //将每一行依次存入到vector中
//        std::cout << line << std::endl;    //顺便打印一下这一行
    }
    ifs.close();
    return lines;
}

std::vector<std::pair<Eigen::Vector3d, Eigen::Quaterniond>> ConvertFormat(const std::vector<std::vector<double>> &liness) {

}

void VisualizePoses(std::vector<std::pair<Eigen::Vector3d, Eigen::Quaterniond>> &poses)
{

}

int main() {
    std::cout << "hello world\n";
    std::string filename = "";
    auto liness = ReadTxt(filename);
    auto poses = ConvertFormat(liness);
    VisualizePoses(poses);
    return 0;
}