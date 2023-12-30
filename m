Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B70CFBE1
	for <perfbook@vger.kernel.org>; Sat, 30 Dec 2023 23:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTSxXW4N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD2CC433C7;
	Sat, 30 Dec 2023 23:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703980655;
	bh=0Gg/Yn12M3cDnncTNr1BhBCf5LotXGhxnOf2ubCWWrQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=TTSxXW4NUtAb7JzPpGUIvgKJ9m1K6RzQjlp3QkKqyP47Kf5Tg6cQWtoKleiVxJIUu
	 15r+t/sL6KlNjttdGthynFxYCBv6ur8VTlB+XAWwivUu36Y/MnJLNHRsf4yFQ9EL1n
	 wU6PfkMJUxbowgvLoxafSlSLbgXLsUf2ZOh3Xyb/kq/hIIpzJzmSmFP1Uw/VPmkdtZ
	 ATbP2g8p/wGo2PwpJCDO9YItgHEc1xmDKF2gfDRx3hHxG/t8x26SumjtAiyn4loLbV
	 TRH8E184YrDrgbbzas2xF5ZK9AgGdM0VNZnlPk7qwrMcYHfOYYWM3JXAS5CQQzJsOc
	 MWLu5iMLsvNew==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AC296CE0D18; Sat, 30 Dec 2023 15:57:34 -0800 (PST)
Date: Sat, 30 Dec 2023 15:57:34 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Hao Lee <haolee.swjtu@gmail.com>, perfbook@vger.kernel.org
Subject: Re: A question about QuickQuiz 5.46
Message-ID: <ad92d88c-b48d-4a51-8640-4ad13e1271b7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
 <20230521075425.GA13425@haolee.io>
 <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
 <c518cdae-cc7a-4de0-bfb6-6bfe81434534@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c518cdae-cc7a-4de0-bfb6-6bfe81434534@gmail.com>

On Sat, Dec 23, 2023 at 06:12:31PM +0900, Akira Yokosawa wrote:
> Hi all,
> 
> I have a comment on this old thread.
> 
> On 2023/05/21 19:42, Akira Yokosawa wrote:
> > On Sun, 21 May 2023 07:54:25 +0000, Hao Lee wrote:
> >> On Fri, May 19, 2023 at 10:27:48PM +0900, Akira Yokosawa wrote:
> >>> On Fri, 19 May 2023 06:28:47 +0000, Hao Lee wrote:
> >>>> On Thu, May 18, 2023 at 10:50:51AM +0900, Akira Yokosawa wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
> >>>>>> Hi, Paul
> >>>>>>
> >>>>>> I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
> >>>>>> balance_count() and flush_local_count() are both located within the
> >>>>>> slowpath and are called sequentially. As a result, it is impossible for
> >>>>>> them to compete for the counterandmax thread-local variable.
> >>>>>
> >>>>> Right.
> >>>>> And that's exactly what is mentioned in the answer to the quiz.
> >>>>>
> >>>>> I guess it confused you because you didn't expect such an easy one,
> >>>>> no ? :-)
> >>>>
> >>>> In fact I'm confused about the question description.
> >>>> I believe that this quiz should focus on the concurrency of global
> >>>> variables, rather than on the concurrency of the atomic variable
> >>>> `counterandmax`, which is currently the main focus of the description.
> >>>
> >>> Hmm, sorry but I'm afraid I don't get your point ...
> >>>
> >>> Could you share the question you'd expect to see in place of
> >>> Quick Quiz 5.46?
> >>
> >> Hi, I don't think this question should exist according to my
> >> understanding...
> >>
> >> Let's approach this question from a different perspective. The answer
> >> emphasizes that the gblcnt_mutex prevents concurrency problems. Let's
> >> assume that neither balance_count() nor flush_local_count() is holding
> >> the gblcnt_mutex. Would the counterandmax variable encounter concurrency
> >> problems? I don't think so because counterandmax is an atomic variable
> >> and is always safe, even without using any locks.
> > 
> > I'm not sure, but you might be missing subtle wording in the quiz part
> > of Quick Quiz 5.46 (quoted below):
> > 
> >     Given that the atomic_set() primitive does a simple store
> >     to the specified atomic_t, ...
> > 
> > Here, "simple store" means a normal store which doesn't involve
> > any atomic operations (at instruction level).
> > 
> > atomic_read() and atomic_set() are for accessing atomic_t variables
> > without any costly atomic operations.
> 
> This was obvious up until commit cee469f9a7aa ("api: Switch x86 atomics
> to gcc C11-like atomics").
> 
> Before the change, atomic_read() and atomic_set() were defined in
> CodeSamples/api.h as:
> 
>     typedef struct { volatile int counter; } atomic_t;
> 
>     #define atomic_read(v)         ((v)->counter)
>     #define atomic_set(v, i)       (((v)->counter) = (i))
> 
> Now, they are defined in CodeSamples/api-pthreads/api-gcc.h as:
> 
>     typedef struct { volatile int counter; } atomic_t;
> 
>     #define atomic_read(v) \
>            __atomic_load_n(&(v)->counter, __ATOMIC_RELAXED)
>     #define atomic_set(v, i) \
>            __atomic_store_n(&(v)->counter, (i), __ATOMIC_RELAXED)
> 
> It is the C compiler's call what instructions to use for accessing
> atomic variables.  Therefore, what Hao said above (quoted again for
> your convenience):
> 
> >>                                                                 Let's
> >> assume that neither balance_count() nor flush_local_count() is holding
> >> the gblcnt_mutex. Would the counterandmax variable encounter concurrency
> >> problems? I don't think so because counterandmax is an atomic variable
> >> and is always safe, even without using any locks.
> 
> is actually quite true.
> 
> Now I think QQz 5.46 needs at least some rewording.
> 
> Hao, apologies for my missing the change under CodeSamples/ at the time.
> 
> Paul, what do you think?

Let's see...

Hao Lee initially suggested that the focus be on the global nonatomics,
which could work.  A related question might be "Why does counterandmax
need to be atomic?"  Another approach would be to focus on wrong settings
for counterandmax based on concurrent invocation.  And there are a number
of other possible confusions that might be caused by this code.

So would either of you like to propose a specific change?

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Which is why Quick Quiz 5.46 has been there for more than a decade.
> > 
> > Perhaps, you might be interested in Quick Quiz B.12 as well.
> >  
> > HTH,
> >         Akira
> > 
> >>
> >>>
> >>>         Thanks, Akira
> >>>
> >>>>
> >>>>>
> >>>>>         Thanks, Akira
> >>>>>
> >>>>>>                                                               Therefore,
> >>>>>> I believe that this quiz may be referring to the global variables
> >>>>>> globalcount and globalreserve.
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Hao Lee
> 
