Return-Path: <SRS0=xThF=W7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=031gsDTVTZRzJNsCHggiwVU8N5vZJDxVPKa20eR4Jms=;
        b=kEDjXrUd5f8xYg2mYq3GXQOwj0szlj/2gBEsvzqEFBOVmDzwUiMCGIH2RovWrininN
         nPRnydSxEnH/GFQcA/yhfU6FuV6YQndYPwerO9LPYim/dNvU6/k2pKoK+Z/H9OkoaAdE
         YhYJC/rzCD/NUz4bB4FnunXGzoIHe8df2GAnJqMksh4ReLfBELhWWctB6hUBeKpYBKpI
         A1qrIvSXSA1EPWBM7WmarngrkbVUCbnSs4SgOJKbGeaJ47F20t0dv1tJ+TNIbpi3o09h
         URHuhilFbFQ+wNPIhyDP9WQfsGqDmqng7+2eFT0WaK/4YHcU+Vd86GfZTRnYxhUQX6Bk
         8MdA==
Message-ID: <cb266856-a20e-231c-00fb-8e4435306d55@gmail.com>
Date: Sat, 25 Jun 2022 08:57:35 +0900
MIME-Version: 1.0
Subject: =?UTF-8?Q?Re=3a_=5bperfbook=5d_Analogy_of_Figure_7=2e11_Locking_?=
 =?UTF-8?B?4oCcU2F3IEtlcmbigJ0=?=
Content-Language: en-US
References: <202dbad7-37db-4d6a-f4d4-6d99180028fc@gmail.com>
 <20220624233316.GF1790663@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220624233316.GF1790663@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 24 Jun 2022 16:33:16 -0700, Paul E. McKenney wrote:
> On Sat, Jun 25, 2022 at 08:12:09AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I find the analogy of Figure 7.11 hard to grasp.
>>
>> Whether a lock is global or per-instance, the cost of locking
>> (saw kerf) is observed only when a CPU/thread does the locking
>> operation.
>>
>> In this figure, does each board represent data elements, not a
>> CPU/thread?  If this is the case, what does the waste of "saw kerf"
>> mean?
>>
>> What am I missing?
>>
>> (I hope I am clear enough on what I don't get...)
> 
> It might well be that I am getting too excited about this one.  ;-)
> 
> Maybe I need to drop it.  At the very least, I need to much more clearly
> explain it.
> 
> But...
> 
> Each board represents one lock.  The "saw kerf" is the time lost when
> releasing that lock and someone else immediately acquiring it.
> 
> Does that help?

Well then, why does the left side figure have ten boards?

        Thanks, Akira

> 
> 							Thanx, Paul
