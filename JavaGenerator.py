import os
from CodeGenerator import CodeGenerator

class JavaGenerator(CodeGenerator):
    def generate_code(self, classes):
        for cls in classes:
            # Correct path to the class
            directory_path = f"testing/{cls.package}"

            # If it's the first class in that package, make the package dir
            if not os.path.exists(directory_path):
                os.makedirs(directory_path)

            # Full file name
            file_name = f"{directory_path}/{cls.name}.java"
            with open(file_name, "w") as file:
                java_code = ""

                # Only include package declaration if the class has a package name
                if cls.package:
                    java_code += f" "

                java_code += "public "

                if cls.isAbstract:
                    java_code += "abstract "

                java_code += f"class {cls.name}"

                if cls.extended:
                    java_code += f" extends {cls.extended}"

                java_code += " {\n"

                for attr in cls.attributes:
                    staticAttribute = ""
                    if attr.isStatic:
                        staticAttribute = "static "

                    if attr.visibility == "package":
                        java_code += f"\t{attr.type_} {staticAttribute}{attr.name};\n"
                    else:
                        java_code += f"\t{attr.visibility} {staticAttribute}{attr.type_} {attr.name};\n"

                for op in cls.operations:
                    parameters_str = ', '.join([f'{p.type_} {p.name}' for p in op.parameters])
                    staticOperation = ""
                    if op.isStatic:
                        staticOperation = "static "

                    abstractOperation = ""
                    if op.isAbstract:
                        abstractOperation = "abstract "

                    if op.visibility == "package":
                        java_code += f"\t{staticOperation}{abstractOperation}{op.return_type} {op.name}({parameters_str});\n"
                    else:
                        java_code += f"\t{op.visibility} {staticOperation}{abstractOperation}{op.return_type} {op.name}({parameters_str}) "
                        java_code += "{\n\t\t// Add method implementation\n\t}\n"

                java_code += "}\n\n"

                file.write(java_code)
