Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbfJ0RLG (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 27 Oct 2019 13:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572196265;
        bh=Dg7vnxEOaQXucREnlbuR/x4wf0tEfbDxuoPfXM85NRw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IvAK7xrJ2S8o+4kdGUSeTxgJyGPzqwC0oE9KusAJiO4vU1gPNlhX6df/ujL9pVlm1
         MmUy+upAKzGxUyqTv2q/egZJ04agiYlszwM6+m441Y62YcBNLt3Q5mP0mVJtocGW07
         tkNpwGYWnCu3QMKTqljK2OZYNdKbdFwdnqiAA2jQ=
Date: Sun, 27 Oct 2019 10:11:03 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question about volatile usage
Message-ID: <20191027171103.GH4465@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+MhoaNUYKgS02EOjNGQi1+5D_Uzw4aWf2_y_gxtBF9ZU8muKA@mail.gmail.com>
 <6622b6a2-b23a-b72f-8ab8-bf38e39d2bc8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6622b6a2-b23a-b72f-8ab8-bf38e39d2bc8@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Nan Xiao <xiaonan830818@gmail.com>, perfbook@vger.kernel.org

On Sun, Oct 27, 2019 at 11:45:07AM +0900, Akira Yokosawa wrote:
> (Added explicit CC: to Paul)
> 
> Hello!
> 
> On Fri, 25 Oct 2019 21:32:35 +0800, Nan Xiao wrote:
> > Hi Paul and perfbook members,
> > 
> > Greetings from me!
> > 
> > I have a question about 4.3.4.2 A Volatile Solution:
> > 
> >> To summarize, the volatile keyword can prevent load tearing and store tearing in cases where the loads and stores are machine-sized and properly aligned. It can also prevent load fusing, store fusing, invented loads, and invented stores. However, although it does prevent the compiler from reordering volatile accesses with each other, it does nothing to prevent the CPU from reordering these accesses. Furthermore, it does nothing to prevent either compiler or CPU from reordering non-volatile accesses with each other or with volatile accesses. Preventing these types of reordering requires the techniques described in the next section.
> > 
> > Does this summary apply for both C and C++? Or C only？
> 
> IIUC, it applies to both C and C++.
> 
> There is an article on LWN (Linux Weekly News) based on this section at:
> 
>     https://lwn.net/Articles/793253/
> 
> The article and comments from readers there might be of your interest.
> 
> If your main concern is application code developed on modern C/C++ compilers
> (C11/C++11 or later), it might be a good idea to use standard language
> features which support concurrent code rather than to use volatile/volatile
> casting.  (There can be changes in C/C++ standards in future, though.)
> 
> Annotation of racy accesses by READ_ONCE()/WRITE_ONCE() to prevent
> compiler optimizations can be seen as abusing of volatile from the
> view point of compiler developers. But it survives generations of
> compilers (with occasional regression reported as bugs in compiler
> optimization).

All good points!

And one reason that volatile survives is that it absolutely must have
certain properties in order for device drivers to work, and none of our
modern computing infrastructure will work without device drivers.

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Thanks very much in advance!
> > 
> > Best Regards
> > Nan Xiao
> > 
> 
