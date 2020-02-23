Return-Path: <SRS0=vn7n=4L=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EMV8GgpNzekYxTmXXwJ5WUpCOZzlUIgpWma+Ks48nsg=;
        b=HO44swNZ8107WHZ7AE4uajxlfdINQPr4eZQ5DpHVGZbmPNUPumYigI7BQyNUoNaqrI
         WHOOo5yN7TBDVKvdAmScmdb8ssyLdFXIv1zmZkDfEkFeX6Y7mdLFCZEMmxB8V64z+Qgc
         VCuqRS4XLLWwD+Z5ABwgJKgGm6HptTOrl8JH1d7gtC87UMXOqeIua4vyvT67MGpwUQxV
         MoHXafq3jrGMkZXupY+KaSzYwIEny4pzfSRpNW/90BM2yaTUp/25NHGcuZRm4X+4lcUQ
         BO3JjwH75woFIGlgf9pVi/UgdjM162xAdDrVdHJxldiilnGxZWcztmzLsVtSX++Ptmp0
         4rvg==
Subject: Re: Towards second edition
References: <20200223153317.GA23764@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dfc81528-fbe1-3a47-5d75-46d92756e6b7@gmail.com>
Date: Mon, 24 Feb 2020 08:42:09 +0900
MIME-Version: 1.0
In-Reply-To: <20200223153317.GA23764@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2020/02/24 0:33, Paul E. McKenney wrote:
> Hello!
> 
> I finally found and fixed the rcu_barrier() bug [1], so I should again
> be able to devote some big-system test time to redoing performance
> results in perfbook.  Once that is done, I expect that it is time for
> the second edition.
> 
> I might also convert the blank page hiding the solution to the Dining
> Philosophers Problem to a quick quiz, but I consider this optional.
> 
> Are there any other changes that are needed? [2]

In response to Junchang's (off the list) proposal, I noticed that
Figure 10.27 needs update to reflect the change in the code done
in early 2019.

Can you update it?

The change simplified the lookup side, but doubled the cost of
updates during resizing. So it is likely the discussion in the text
also needs update.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> 
> [1] The fix is at 77abca1c358a ("rcu: Make rcu_barrier() account for
>     offline no-CBs CPUs") in -rcu, in case anyone is curious.
> 
> [2] Here is a list of some things that I believe can follow the second
>     edition:
> 
> 	Expand lock-free algorithm discussion to include LIFO push,
> 	illustrating the infamous pointer-zap issue.  (See ISO SC22
> 	WG21 P1726R3, which should appear in a couple of weeks, for
> 	more details.)
> 
> 	Add text describing the Issaquah Challenge.
> 
> 	Add text describing skiplists, one of the more concurrency
> 	friendly data structures.
> 
> 	Add text describing data-race detectors such as KCSAN.  (This needs
> 	to wait for more Linux-kernel experience.)
> 
> 	Additional material from todo.txt.  ;-)
> 
