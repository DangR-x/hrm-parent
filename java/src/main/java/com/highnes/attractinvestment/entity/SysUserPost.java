package com.highnes.attractinvestment.entity;


/**
 * 用户与岗位关联对象 sys_user_post
 * 
 * @author ranlj
 * @date 2020-05-18
 */
public class SysUserPost extends BaseEntity<SysUserPost> {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 岗位ID
     */
    private String postId;


    public SysUserPost(){
        super();
    }

    public SysUserPost(String id){
        super(id);
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getPostId() {
        return postId;
    }


}
