Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A9B225A35
	for <perfbook@vger.kernel.org>; Thu, 27 Nov 2025 00:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764204301; cv=none; b=pR97lNPCFiK1wj99E0gsYVOtNeWfAFKhgMxBev7n2iiu4vIsEFeM8mPm/OOVNvXCdYA4qSdHw2jjZr0ydNjLHemU6QZ6TXziRrKYuRrj42OnQs+zU6Ylz/iTjIfZ7N3SqlKZrcKSsRLrWoCE6AEYcj4VsRJeTnXXf5NoTfp+2bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764204301; c=relaxed/simple;
	bh=inVbxcWeZ86R3bvqVhSUdG1O2M8UUDLgD68ERp5F30E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1qjTFbgDzzEO+d7fqBqBHfgWESjJ9B7ZTqqziOxZmwyUXP5ln1qZYgTCxj+cbbKlasGlYIcOewDhQVwxXWEtlMTQZK4jbfU05fmTkCl7D+PeJfFc3Pm96zlYiN8TYn6ZkTV3c1eXdS76TqpUcQJVGnPMZDMYXcuFAywY/uiMFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DV9bE7f+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DV9bE7f+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA5FC4CEF7;
	Thu, 27 Nov 2025 00:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764204301;
	bh=inVbxcWeZ86R3bvqVhSUdG1O2M8UUDLgD68ERp5F30E=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=DV9bE7f+yag8nr42IhKVD0EBsQNDfNGQ7+il/sLTzEMRqguYSNEb7taZGE4GRw3zA
	 omGf9T9EVX7o7fe/UcREvUluRU0AUbcSruXFxLw0rfAWJu0Tc7JeqxgypOSgEcM8by
	 uye0ObAAqneFo3Dhssb9eI1RJJOUSuuDoWLWFwvsLmuyw6YlYlD0q40+a/M/cRoK6u
	 ypNt+muw8WX2fdbIRcM4+VNMWBEj/NoanytF5k/EwcNwee70VcgOXiLPaQ2MxIJVr2
	 z3XWNGh+frJnJ++JYEp6UXN4o3bB1qqb62oDmo5NlNzBlI3HYczKq49wWas42i2KUL
	 QVsxsI/oNciZA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 69934CE0E29; Wed, 26 Nov 2025 16:45:00 -0800 (PST)
Date: Wed, 26 Nov 2025 16:45:00 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 0/3] CodeSamples/formal/herd: Tweaks for new
 litmus tests
Message-ID: <74e097c3-1811-4346-82c2-18ebb88aca8d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
 <7c5487c4-1ecd-4522-b14e-dd00d4c52319@paulmck-laptop>
 <a6128f7a-a811-4121-b877-4103782f3fdc@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6128f7a-a811-4121-b877-4103782f3fdc@gmail.com>

On Thu, Nov 27, 2025 at 12:43:28AM +0900, Akira Yokosawa wrote:
> On Mon, 24 Nov 2025 09:14:57 -0800, Paul E. McKenney wrote:
> > On Mon, Nov 24, 2025 at 06:10:56PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> I see a couple of minor issues in running
> >>
> >>    - make cross-klitmus; cd klitmus; make
> >>    - make run-herd7
> >>
> >> under CodeSamples/formal/herd/.
> >>
> >> This patch set should resolve those issues.
> > 
> > Queued and pushed, thank you!
> 
> Paul, this is a side note with regard to klitmus7.
> 
> In the old days with Linux kernel <6.0, tests listed in KLITMUS_READY
> took less than a minute.
> 
> That have changed a lot.  Litmus tests with RCU primitives tend to
> take much longer.
> 
> In the list of processes shown by "top", such klitmus threads are
> accompanied by a single (and fairly busy) "rcu_exp_gp_kthread_worker".
> Yes, the frequency RCU primitives are invoked in those litmus tests,
> especially synchronize_rcu(), is unusually high.  In realistic workloads,
> such burst of synchronize_rcu()s would indicate you are doing something
> wrong.  So the longer time to complete does not mean any performance
> regression.

If I remember correctly, the klitmus tool switch from synchronize_rcu() to
synchronize_rcu_expedited() at about that time.  That would definitely
account for the appearance of rcu_exp_gp_kthread_worker(), which
handles expedited grace periods.  The motivation for switching klitmus
to synchronize_rcu_expedited() is that the shorter grace periods make
detecting RCU-usage bugs in litmus tests.

Except that your data below shows that downgrading to a pre-v6.0 kernel
reduces the overhead.  Hmmm...

> Following is a list of summaries from C-RomanPenyaev-list-rcu-rr runs
> under several VMs:
> 
> - Ubuntu 20.04 POWER8 (kernel: 5.4.0-223-generic #243-Ubuntu SMP, 8 CPUs)
> 
>   Hash=890796f9231134fff935fc64b2b98940
>   Observation C-RomanPenyaev-list-rcu-rr Never 0 4000000
>   Time C-RomanPenyaev-list-rcu-rr 17.85
> 
>   no rcu_exp_gp_kthread_worker.
> 
> - Ubuntu 24.04 POWER9 (kernel: 6.8.0-88-generic #89-Ubuntu SMP, 8 CPUs)
> 
>   Hash=890796f9231134fff935fc64b2b98940
>   Observation C-RomanPenyaev-list-rcu-rr Never 0 4000000
>   Time C-RomanPenyaev-list-rcu-rr 153.49
> 
>   no rcu_exp_gp_kthread_worker observed.
> 
> - Ubuntu 24.04 x86_64 (kernel: 6.8.0-88-generic #89-Ubuntu SMP PREEMPT_DYNAMIC, 6 CPUs)
> 
>   Hash=890796f9231134fff935fc64b2b98940
>   Observation C-RomanPenyaev-list-rcu-rr Never 0 3000000
>   Time C-RomanPenyaev-list-rcu-rr 60.46
> 
>   no rcu_exp_gp_kthread_worker.
> 
> - Ubuntu 25.10 x86_64 (kernel: 6.17.0-7-generic #7-Ubuntu SMP PREEMPT_DYNAMIC, 6 CPUs)
> 
>   Hash=890796f9231134fff935fc64b2b98940
>   Observation C-RomanPenyaev-list-rcu-rr Never 0 3000000
>   Time C-RomanPenyaev-list-rcu-rr 311.79
> 
>   rcu_exp_gp_kthread_worker consumes a lot of time.
> 
> - Fedora 43 x86_64 (kernel: 6.17.8-300.fc43.x86_64 #1 SMP PREEMPT_DYNAMIC, 6 CPUs)
> 
>   Hash=890796f9231134fff935fc64b2b98940
>   Observation C-RomanPenyaev-list-rcu-rr Never 0 3000000
>   Time C-RomanPenyaev-list-rcu-rr 326.54
> 
>   rcu_exp_gp_kthread_worker consumes a lot of time.

How much time?  A full CPU's worth through the klitmus run?  More than
a CPU?  Less?

You mention that this might not be a regression, but then again, it might
well be.  ;-)

> Just out of curiosity, is there any knob I can tweak to reduce the time
> to complete, preferably some kernel boot arg?

Well, there is the rcupdate.rcu_normal=1 kernel boot parameter, which
disables expedited grace periods completely.  But that cure might be
worse than the disease.

Just to make sure, you are using the exact same version of klitmus
throughout, right?

If you are using the same klitmus throughout, are you comfortable building
and booting kernels on any of these systems?  (If so, I would ask you to
bisect, but to focus only on changes affecting kernel/rcu, for example,
"git bisect start v6.17 v6.8 -- kernel/rcu".)

							Thanx, Paul
