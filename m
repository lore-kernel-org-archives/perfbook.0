Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FXcgSz7QfenIPZqy8SzmlThbL8qQD0o4exhkr5xyF4o=;
        b=bZS1Of0QaSWNKpQIp0b1oTylAhvcKmDH/20tgyJzaZt7ZTbl3H2uxJI2xBXYgbECsj
         lgr+L+ZPr3EjSBZ15KNbP6Rn8qlffAHaH6GKoyiJ1k+aQ8PtrgB9VXH5bkoL1W3bMDAm
         EBQORreAoCTUaVIK6HiJ3GFN6aJHP6y3oNAxfUMQAlxcj8vdSFzFJMgIt/gUMZDbOhcI
         /rsRt5Az+brUCeCjdi3QiT4A5Y6UAsMKjpBgGAHz9YMhdMFqf/13M6i3qOu/iBmFs9AE
         +t+GLd4ElBQbBWUamye4MCqmL+J4oAHGM9ejK0XqVw4aFo25X1O0Qh9Td2z4Laam6227
         u4KQ==
Subject: Re: [Not a patch] Possible incomplete sentence/clause in defer/hazptr
References: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
 <d4dbe4e8-0f2f-49ff-8f40-09be23795e00@gmail.com>
 <20190421184506.GD24840@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <24979174-47b3-a087-ecd1-0c2d0ba12397@gmail.com>
Date: Mon, 22 Apr 2019 07:19:36 +0900
MIME-Version: 1.0
In-Reply-To: <20190421184506.GD24840@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 21 Apr 2019 11:45:06 -0700, Paul E. McKenney wrote:
> On Mon, Apr 22, 2019 at 12:25:00AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> The sentence shown below as a diff looks incomplete to me.
>> What is your intention here?
> 
> Not that!  Thank you for catching this!!!  Please see below for an
> attempted fix.  Thoughts?
> 
> I have queued your four patches.  My problems are (1) force of habit
> and (2) failing to remember that comment-only lines are discarded.

And please remember the option "keepcomment=yes" can change the
behavior.  This reminds me that I need to update style guide.

> I am not all that happy with the #ifdef, but it beats the alternative.
> But what I did in this case was to just remove the fprintf() in favor
> of the BUG_ON().  ;-)

Yes, that sounds reasonable.

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 72e774fda87eaead9637d887426b701ec229664d
> Author: Paul E. McKenney <paulmck@linux.ibm.com>
> Date:   Sun Apr 21 11:33:49 2019 -0700
> 
>     defer/hazptr: Fix broken statement of restart location constraints
>     
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> 
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index 4b61d34d334c..b491c590ae2d 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -239,9 +239,12 @@ Which is a very good thing, because B's successor is the now-freed
>  element~C, which means that Thread~0's subsequent accesses might have
>  resulted in arbitrarily horrible memory corruption, especially if the
>  memory for element~C had since been re-allocated for some other purpose.
> -Therefore, statically allocated global variables), hazard-pointer
> -readers must typically restart the full traversal in the face of a
> -concurrent deletion.
> +Therefore, hazard-pointer readers must typically restart the full
> +traversal in the face of a concurrent deletion.
> +Often the restart must go back to some global (and thus immortal) pointer,
> +but it is sometimes possible to restart at some intermediate location
> +if that location is guaranteed to still be live, for example, due to
> +the current thread holding a lock, a reference count, etc.

Looks good to me!

        Thanks, Akira

>  
>  \QuickQuiz{}
>  	Readers must ``typically'' restart?
> 

