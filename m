Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728846AbgBYD6s (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 24 Feb 2020 22:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582603127;
        bh=24dBH8yH3XKlgNvLY1z170eXTqN1JfTVtxmplXN3Q6c=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=n7YOJyOD4plumIoib2Q5XD4blrtruOyrt/Hj62k8tSfQBjE3kYJEYK6dyDymK7iQ6
         SINEhRj7CWYmPRoomf1JH1X0LDBc6JNiPFS5b1e+witwN/UMKnWywX5L58NIW3sLaZ
         husMJtXBO139SXsYu3KmnpUpXWrGsAPx7J4wAyyo=
Date: Mon, 24 Feb 2020 19:58:46 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Towards second edition
Message-ID: <20200225035846.GV2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200223153317.GA23764@paulmck-ThinkPad-P72>
 <dfc81528-fbe1-3a47-5d75-46d92756e6b7@gmail.com>
 <20200224024549.GG2935@paulmck-ThinkPad-P72>
 <20200225033055.GA1941@VM_0_3_centos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225033055.GA1941@VM_0_3_centos>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchang2020@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Tue, Feb 25, 2020 at 11:30:57AM +0800, Junchang Wang wrote:
> On Sun, Feb 23, 2020 at 06:45:49PM -0800, Paul E. McKenney wrote:
> >On Mon, Feb 24, 2020 at 08:42:09AM +0900, Akira Yokosawa wrote:
> >> On 2020/02/24 0:33, Paul E. McKenney wrote:
> >> > Hello!
> >> > 
> >> > I finally found and fixed the rcu_barrier() bug [1], so I should again
> >> > be able to devote some big-system test time to redoing performance
> >> > results in perfbook.  Once that is done, I expect that it is time for
> >> > the second edition.
> >> > 
> >> > I might also convert the blank page hiding the solution to the Dining
> >> > Philosophers Problem to a quick quiz, but I consider this optional.
> >> > 
> >> > Are there any other changes that are needed? [2]
> >> 
> >> In response to Junchang's (off the list) proposal, I noticed that
> >> Figure 10.27 needs update to reflect the change in the code done
> >> in early 2019.
> >> 
> >> Can you update it?
> >> 
> >> The change simplified the lookup side, but doubled the cost of
> >> updates during resizing. So it is likely the discussion in the text
> >> also needs update.
> >
> >I will update this when rerunning on the large system in any case,
> >but thank you for calling my attention to this.  Yes, it does need
> >to be fixed.  (My problem in early 2019 was not having access to
> >a large system, now solved!)
> >
> 
> Hi Paul and Akira,
> 
> I think you are discussing Figure 10.17 (Overhead of Resizing Hash
> Tables Between 1024 ...). Is that right?
> 
> Here is a comment on this performance evaluation. Test framework
> hashtorture.h indirectly controls the number of elements in a hash table
> (and the average load factor) by inserting nupdaters*elperupdater/2
> elements before running a test, such that U = nupdaters*elperupdater,
> where U is the size of the pool of all of the test elements.  This
> approach worked well for old machines. One thing worth noting is that U
> could be too small for currently available servers which typically have
> larger Last Level Caches of dozens of megabytes. For example, the LLC of
> the E5 CPU I used to evaluate rehash can perfectly hold 131,072*2
> elements, and hence lookup operations barely reach the memory (The Linux
> perf reports close to zero cache misses.) Update/resize operations
> update some elements and invalidate some cachelines, but it seems the
> hardware prefetcher works well in this case, given that the test set U
> is relatively small.
> 
> If we want to test the hash algorithm in an environment where lookup
> operations may need to fetch data from memory, U should be set to a much
> bigger number (e.g., 10M). But a bigger U means a bigger number of
> pre-inserted elements if the above mentioned approach is used. So in my
> experiments, I extended hashtorture.h and broke the relationship between
> these two numbers. Please let me know if there are any other solutions.
> 
> But like you said, the code and the evaluation figure should be
> simplified for a textbook. So I think it's reasonable that you still use
> the existing approach, but the comment may worth being mentioned in the
> perfbook to better explain your experimental result.

Here is hoping that you are not increasing the hash-table per-bucket
load factor as you increase the number of CPUs, as one unfortunate recent
paper did.  Who is reviewing these things, anyway???  ;-)

							Thanx, Paul

> Thanks,
> --Junchang
> 
> 
> >							Thanx, Paul
> >
> >>         Thanks, Akira
> >> 
> >> > 
> >> > 							Thanx, Paul
> >> > 
> >> > 
> >> > [1] The fix is at 77abca1c358a ("rcu: Make rcu_barrier() account for
> >> >     offline no-CBs CPUs") in -rcu, in case anyone is curious.
> >> > 
> >> > [2] Here is a list of some things that I believe can follow the second
> >> >     edition:
> >> > 
> >> > 	Expand lock-free algorithm discussion to include LIFO push,
> >> > 	illustrating the infamous pointer-zap issue.  (See ISO SC22
> >> > 	WG21 P1726R3, which should appear in a couple of weeks, for
> >> > 	more details.)
> >> > 
> >> > 	Add text describing the Issaquah Challenge.
> >> > 
> >> > 	Add text describing skiplists, one of the more concurrency
> >> > 	friendly data structures.
> >> > 
> >> > 	Add text describing data-race detectors such as KCSAN.  (This needs
> >> > 	to wait for more Linux-kernel experience.)
> >> > 
> >> > 	Additional material from todo.txt.  ;-)
> >> > 
