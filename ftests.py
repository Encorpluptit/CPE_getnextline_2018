#!/usr/bin/env python3
##
## EPITECH PROJECT, 2019
## Any project.
## File description:
## Functionnals tests for projects.
##

from subprocess import Popen, PIPE

PGRM = "./get_next_line"
REFPGRM = PGRM + "_ref"
#REFPGRM = "./a.out"
#REFPRGM = "tcsh"

#TO DO: try except assertiuon error print std ou returncode

##class launch + echo
class launch_simple:
    def __init__(self, cmd):
        self.command = str.encode(cmd)
        self.my_pgrm = Popen([PGRM], stdin=PIPE, stdout=PIPE, stderr=PIPE, shell=True)
        self.pgrm_stdout, self.pgrm_stderr = self.my_pgrm.communicate(input = self.command)
        self.pgrm_returncode = self.my_pgrm.returncode

#    def test(self):
#        assert(self.pgrm_stdout == self.ref_stdout)
#        assert(self.pgrm_stderr == self.ref_stderr)
#        assert(self.pgrm_returncode == self.ref_returncode)

    def test_stdout(self, stdout):
        assert(self.pgrm_stdout == stdout)

    def test_stderr(self, stderr):
        assert(self.pgrm_stderr == stderr)

    def test_returncode(self, returncode):
        assert(self.pgrm_returncode == returncode)

##class launch + launch ref + echo
class launch_both:
    def __init__(self, cmd):
        command = PGRM + " " + cmd
        self.command = str.encode(command)
        command = REFPGRM + " " + cmd
        self.ref_command = str.encode(command)
        self.my_pgrm = Popen(["bash"], stdin=PIPE, stdout=PIPE, stderr=PIPE, shell=True)
        self.ref_pgrm = Popen(["bash"], stdin=PIPE, stdout=PIPE, stderr=PIPE, shell=True)
        self.pgrm_stdout, self.pgrm_stderr = self.my_pgrm.communicate(input = self.command)
        self.ref_stdout, self.ref_stderr = self.ref_pgrm.communicate(input = self.ref_command)
        self.pgrm_returncode = self.my_pgrm.returncode
        self.ref_returncode = self.ref_pgrm.returncode

    def test(self):
        try:
            assert(self.pgrm_stdout == self.ref_stdout)
            assert(self.pgrm_stderr == self.ref_stderr)
            assert(self.pgrm_returncode == self.ref_returncode)
        except AssertionError:
            print("Assertion error")
            print(self.ref_stdout)
            print(self.pgrm_stdout)


    def test_stdout(self):
        assert(self.pgrm_stdout == self.ref_stdout)

    def test_stderr(self):
        assert(self.pgrm_stderr == self.ref_stderr)

    def test_returncode(self):
        assert(self.pgrm_returncode == self.ref_returncode)

# def test_ls():
#     ls = simpleTest("ls")
#     ls.test()

def test_ez_rs20():
    ez_rs_20 = launch_both("tests/ressources/test_ez")
    ez_rs_20.test()
def test_ez_rs200():
    ez_rs_20 = launch_both("tests/ressources/test_small")
    ez_rs_20.test()
def test_ez_rs201():
    ez_rs_20 = launch_both("tests/ressources/test_endline")
    ez_rs_20.test()
def test_ez_rs202():
    ez_rs_20 = launch_both("tests/ressources/test_text")
    ez_rs_20.test()
def test_ez_rs203():
    ez_rs_20 = launch_both("tests/ressources/wrap_norm_malloc.c")
    ez_rs_20.test()
def test_ez_rs204():
    ez_rs_20 = launch_both("tests/ressources/wrap_real_malloc.c")
    ez_rs_20.test()

def main():
    test_ez_rs20()
    test_ez_rs200()
    test_ez_rs201()
    test_ez_rs202()
    test_ez_rs203()
    test_ez_rs204()
    print("ALL TESTS SUCCESSFULLY PASSED !")

if __name__ == "__main__":
    main()
