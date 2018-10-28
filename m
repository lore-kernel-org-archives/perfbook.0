Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LWAfIuPAIwFRZyEA9rqecXDlSE4vq0LKH2j4aLNQH4k=;
        b=agCXxLquEdZRQEoDDaIoGc8jkK14Xt4t2Wtmld0xxcQx0ad2b0yJeJU80LqXEUyPuX
         VVXCtHYlM+UWeaK7Xfcsv0PRL5uHk3wuGdbMI0PE7PFl7IyenwmD5RsR1yxE5MSpaqCH
         cCNvhBPFxGfYJ2gH37xkTAOWb9rJiPvG2ad9kIQubISoXnvYhHoHnU86jnD7tImGJngj
         jVBu3DhdKoRh7ICrj2hJ4yhklx4rtJtHPNrdnoqMA4WeD1e9sysmo6+3GDzdvtgzjzk1
         thCrVRezRUY3tG+5X4WWkBMJdEEAvY68AJcMz7g8TtUtrSnrOp72NJaKCdSfEgCNzWa6
         wsYw==
Subject: Re: Release/edition plans
References: <20181018203414.GA19175@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <929eef9a-f1c7-22a8-b5bc-f95f6f573b4c@gmail.com>
Date: Mon, 29 Oct 2018 00:19:56 +0900
MIME-Version: 1.0
In-Reply-To: <20181018203414.GA19175@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/18 13:34:14 -0700, Paul E. McKenney wrote:
> Hello!
> 
> I would normally have done a perfbook release by now, given that the last
> one was in November 2017.  My lame excuse is that creating 340 RCU/LKMM
> patches thus far this year turned out to be a bit harder than it looks.
> 
> My current thought is to get a release out in the next month or two,
> and to get the second edition out in 2019.
> 
> Thoughts?

I'd like to know your rough plan to reflect the LKMM/RCU updates to
perfbook. Those updates affect mostly Chapter 15 and Section 9.5.

I understand that perfbook will keep slightly out-of-date because of
the always moving goal post. ;-)

Also, update of Style Guide is in my todo list to explain the new scheme
of code snippet handled by fancyvrb.  Hopefully, that can be done in a month
or so.  

OTOH, actual conversion of code snippets can take much longer. Labeling
lines in snippets is not trivial and can only be done one by one.
No need to harry in this respect, I suppose.

        Thanks, Akira

> 
> 							Thanx, Paul
> 

