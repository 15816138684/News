package cn.com.po;

import java.util.List;

public class BlogState {
    private List<Integer> IDS;

    @Override
    public String toString() {
        return "BlogState [IDS=" + IDS + ", max=" + max + ", min=" + min + "]";
    }

    public List<Integer> getIDS() {
        return IDS;
    }

    public void setIDS(List<Integer> iDS) {
        IDS = iDS;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    private int max;

    private int min;
}
