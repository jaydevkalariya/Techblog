function doLike(pid, uid) {

    console.log(pid + "," + uid);
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(pid);
            if (data.trim() == 'true') {

                let c = $("." + pid).html();
                console.log(c);
                c++;
                $("." + pid).html(c);

            }
            else {
                let c = $("." + pid).html();
                c--;
                $("." + pid).html(c);

            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
};
function doLike_c(cmid, uid) {

    console.log(cmid + "," + uid);
    const d = {
        uid: uid,
        cmid: cmid,
        operation: 'like_c'
    };

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(cmid);
            if (data.trim() == 'true') {

                let c = $("." + cmid).html();
                console.log(c);
                c++;
                $("." + cmid).html(c);

            }
            else {
                let c = $("." + cmid).html();
                c--;
                $("." + cmid).html(c);

            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    })
}
function deleteComment_c(cmid) {

    console.log(cmid);
    const d = {
        cmid: cmid,
        operation: 'deleteComment'
    };

    $.ajax({
        url: "AddCommentServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {


            $(".-" + cmid).css("display", "none");

            let c = $(".countcomment").html();
            c--;
            $(".countcomment").html(c);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    })
}
function deletePost(pid) {

    console.log(pid);
    const d = {
        pid: pid,
        operation: 'deletePost'
    };

    $.ajax({
        url: "AddPostServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {


            $(".-" + pid).css("display", "none");


        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}

function checkCode(pid) {
    var code = prompt("Enter secret Code for Premium Blog:");
    const d = {
        code: code
    };

    $.ajax({
        url: "checkPremiumPost",
        data: d,
        success: function (data, textStatus, jqXHR) {
            //success ..

            if (data.trim() == 'done') {
                location.href = "show_blog_page.jsp?post_id=" + pid + "";
            } else {
                swal("Error!!", "Code is invalid!!", "error");
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            //error..
            swal("Error!!", "Something went wrong try again...", "error");
        }
    });
}





function deletePost(pid) {

    console.log(pid);
    const d = {
        pid: pid,
        operation: 'deletePost'
    };

    $.ajax({
        url: "AddPostServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {


            $(".-" + pid).css("display", "none");


        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}



function display(s) {

    if (s == 'post') {

        $(".show_post").show();

        $(".show_user").hide();

    }
    if (s == 'user') {

        $(".show_user").show();

        $(".show_post").hide();


    }

}



$("body").children().first().before($(".modal"));
$(document).ready(function () {
    let editStatus = false;

    $('#edit-profile-button').click(function () {

        if (editStatus == false) {
            $("#profile-details").hide()

            $("#profile-edit").show();
            editStatus = true;
            $(this).text("Back")
        } else {
            $("#profile-details").show()

            $("#profile-edit").hide();
            editStatus = false;
            $(this).text("Edit")

        }


    })
});


$(document).ready(function (e) {
    //
    $("#add-post-form").on("submit", function (event) {
        //this code gets called when form is submitted....
        event.preventDefault();
        console.log("you have clicked on submit..")
        let form = new FormData(this);

        //now requesting to server
        $.ajax({
            url: "AddPostServlet",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                //success ..
                console.log(data);
                if (data.trim() == 'done') {
                    swal({
                        title: "Good job!",
                        text: "saved succesfully",
                        type: "success"
                    }).then(function () {
                        window.location = "profile_admin.jsp";
                    });
                } else {
                    swal({
                        title: "try again..",
                        text: "something went wrong!!",
                        type: "error"
                    }).then(function () {
                        window.location = "profile_admin.jsp";
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //error..
                swal("Error!!", "Something went wrong try again...", "error");
            },
            processData: false,
            contentType: false
        });
    });
});





function deleteCategory(catId) {

    $.ajax({
        url: "AddCategoryServlet",
        data: {
            cid: catId,
            doo: "Delete"
        },
        success: function (data, textStatus, jqXHR) {
            window.location.reload();
        },
        error: function (jqXHR, textStatus, errorThrown) {

            swal("Error!!", "Something went wrong try again....", "error");
        }
    });


}









