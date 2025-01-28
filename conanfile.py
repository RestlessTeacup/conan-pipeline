from conan import ConanFile
from conan.tools.cmake import CMake, cmake_layout

class App(ConanFile):
    """Класс для сборки проекта с зависимостью из Conan"""
    settings = "os", "compiler", "arch", "build_type"
    generators = "CMakeToolchain", "CMakeDeps"
    
    # Указание на зависимость
    def requirements(self):
        self.requires("fmt/10.2.1")

    # Выбор стандартной структуры проекта для отказоустойчивости
    def layout(self):
        cmake_layout(self)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()