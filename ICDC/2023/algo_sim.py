# EEGuizhi
import numpy as np


PAT_SIZE = (16, 16)
PAT = (
    np.array([(11, 0), (2, 1), (8, 1), (10, 1), (4, 6), (1, 7), (2, 7), (7, 7), (8, 7), (9, 7), (13, 7), (5, 8), (7, 8), (4, 9), (6, 9), (10, 9), (12, 9), (3, 10), (7, 10), (8, 10), (13, 10), (14, 10), (3, 11), (7, 11), (8, 11), (11, 11), (12, 11), (1, 12), (5, 12), (8, 12), (11, 12), (13, 12), (14, 12), (3, 13), (4, 13), (13, 13), (9, 14), (11, 14), (13, 14), (6, 15)]),
    np.array([(8, 0), (6, 1), (7, 2), (12, 2), (1, 3), (10, 3), (11, 3), (3, 4), (7, 4), (8, 4), (13, 4), (0, 5), (10, 5), (2, 7), (5, 7), (8, 7), (14, 7), (4, 8), (8, 8), (9, 8), (10, 8), (11, 8), (12, 8), (2, 9), (3, 9), (11, 9), (12, 9), (3, 10), (4, 11), (5, 11), (8, 11), (15, 11), (2, 12), (6, 12), (7, 12), (6, 13), (7, 13), (9, 13), (2, 14), (4, 14)]),
    np.array([(9, 0), (2, 1), (10, 2), (12, 2), (15, 2), (7, 3), (9, 3), (8, 4), (4, 5), (6, 5), (10, 5), (12, 5), (13, 5), (5, 6), (11, 6), (0, 7), (2, 7), (4, 7), (9, 7), (10, 7), (13, 7), (3, 8), (7, 8), (10, 8), (2, 9), (5, 9), (8, 9), (9, 9), (10, 9), (4, 10), (5, 10), (6, 10), (8, 10), (9, 10), (7, 11), (11, 11), (12, 11), (7, 13), (10, 13), (3, 15)]),
    np.array([(9, 0), (5, 1), (10, 1), (5, 2), (1, 3), (7, 3), (12, 3), (13, 3), (5, 4), (9, 4), (10, 4), (0, 5), (4, 5), (6, 5), (7, 5), (9, 5), (11, 5), (2, 6), (5, 6), (9, 6), (10, 6), (11, 6), (12, 6), (2, 7), (4, 7), (11, 7), (3, 8), (5, 8), (6, 8), (7, 8), (9, 8), (12, 8), (5, 9), (7, 9), (1, 10), (4, 10), (9, 10), (13, 10), (14, 10), (8, 15)]),
    np.array([(0, 0), (7, 0), (10, 0), (14, 0), (9, 1), (1, 2), (3, 2), (5, 2), (14, 2), (8, 3), (14, 3), (12, 4), (3, 5), (1, 7), (3, 7), (4, 7), (0, 8), (7, 8), (8, 8), (3, 9), (10, 9), (0, 10), (9, 10), (4, 11), (7, 11), (14, 11), (1, 12), (4, 12), (7, 12), (9, 12), (2, 13), (5, 13), (7, 13), (8, 13), (2, 14), (4, 14), (8, 14), (9, 14), (2, 15), (10, 15)]),
    np.array([(2, 0), (13, 0), (15, 0), (10, 1), (13, 1), (9, 2), (15, 2), (2, 3), (11, 3), (15, 3), (4, 4), (7, 4), (10, 4), (12, 4), (13, 4), (9, 5), (12, 5), (7, 6), (8, 6), (9, 6), (10, 6), (1, 7), (8, 7), (10, 7), (11, 7), (15, 7), (7, 8), (10, 8), (7, 9), (8, 9), (9, 9), (10, 9), (11, 9), (8, 10), (9, 10), (14, 10), (10, 11), (6, 12), (12, 13), (1, 14)])
)
ANS = (
    30,
    28,
    29,
    30,
    23,
    30
)
X, Y = 0, 1


def count_cover(pat:np.ndarray, c1:np.ndarray, c2:np.ndarray, radius:int=4):
    # "pat - c1" equivalent to "np.expand_dims(c2, axis=0).repeat(pat.shape[0], axis=0) - pat"
    c1_dist = np.sum((pat - c1)**2, axis=-1)
    c2_dist = np.sum((pat - c2)**2, axis=-1)
    
    count = 0
    r = radius**2
    for i in range(pat.shape[0]):
        if (c1_dist[i] <= r) or (c2_dist[i] <= r):
            count += 1
    
    return count


def fixone_getanother(pat_size:tuple, pat:np.ndarray, c_fix:np.ndarray):
    # init
    c_best = None
    obj_count = 0
    max_count = 0
    
    # fix the center "c_fix", and find the best position of another center
    for y in range(pat_size[Y]):
        for x in range(pat_size[X]):
            c_new = np.array([x, y])  # try every pos
            obj_count = count_cover(pat, c_fix, c_new)
            if obj_count >= max_count:  # log the best pos
                """
                附註：上方(line 50)條件式 "必須" 是 ">=" 否則結果會錯 (只能說這題給的Patterns其實出的不太好)
                """
                max_count = obj_count
                c_best = c_new
    return c_best, max_count


def find_centers(pat_size:tuple, pat:np.ndarray):
    print(f"total objects count = {pat.shape[0]}")
    
    # init
    c1 = np.array([0, 0])
    c2 = np.array([100, 100])
    update_C1orC2 = 1
    converge = False
    max_count = 0
    
    # update c1 & c2 in turn
    while not converge:
        if update_C1orC2 == 1:  # update c1
            c1_new, obj_count = fixone_getanother(pat_size, pat, c_fix=c2)
            print(f"find c1 = {c1_new}, cover = {obj_count}")
            if c1[0] == c1_new[0] and c1[1] == c1_new[1] and obj_count <= max_count:
                converge = True
            else:
                c1 = c1_new
                update_C1orC2 = 2
        else:  # update c2
            c2_new, obj_count = fixone_getanother(pat_size, pat, c_fix=c1)
            print(f"find c2 = {c2_new}, cover = {obj_count}")
            if c2[0] == c2_new[0] and c2[1] == c2_new[1] and obj_count <= max_count:
                converge = True
            else:
                c2 = c2_new
                update_C1orC2 = 1
        
        max_count = obj_count
    
    return c1, c2, max_count


if __name__ == "__main__":
    np.set_printoptions(formatter={'int': lambda x: f"{x: 3}"}, suppress=True)
    for i in range(len(PAT)):
        print(f">> Pattern {i+1}:")
        c1, c2, cover = find_centers(PAT_SIZE, PAT[i])
        print(f"best centers: C1 = {c1}, C2 = {c2}")
        print(f"==> Cover = {cover}, Opt = {ANS[i]}, Pass = {cover == ANS[i]}\n")
