Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669323405;
	bh=xoqIhleB0ItoLFxrY3QApQt5Y8XJARErfKwu/OO2GvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m1RaGTlTuZ9O6OzQ0Udeey1AqFOKT/fNsWAaFRLj29/K8bm5UMbHTfoQZwNk47T9y
	 tpcquFVK+CycmI0jsd70s8bmu/h8j0/9LjJ3y8LY6s4m05NySTt5/sJmvGY/Ju/Q/9
	 x6J4TEHQrFXvNkV4MmuYCvR5sRzr/b4wIbEhyBbUVQ6UqfiLqv4bGaCYdDsgBOXcL0
	 Em62nLimqUki/7xZwT0/HxQXuxT7YsM60XxWfAaCge8SpJrIOUCvri08lEeJAzoIWi
	 H6wkLa3oYtGWIecxx+rqgNcsdkTpdezvziZpaPjGUQpUWCFTiLdkTQPY+8SIh7Jagq
	 v0eMDNfc8VyRw==
From: SeongJae Park <sj@kernel.org>
Subject: RE: [PATCH 00/13] Minor fixes for defer/
Date: Thu, 24 Nov 2022 20:56:43 +0000
Message-Id: <20221124205643.135020-1-sj@kernel.org>
In-Reply-To: <20221124204823.GW4001@paulmck-ThinkPad-P17-Gen-1>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 24 Nov 2022 12:48:23 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Thu, Nov 24, 2022 at 10:57:49AM -0800, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> >
> > This patchset contains minor fixes for defer/ that found during the
> > Korean translation[1] of it.
> >
> > [1] https://github.com/sjp38/perfbook-ko_KR
> 
> Good catches, thank you!!!  Queued and pushed.
> 
> And a happy Thanksgiving weekend to you, assuming that you are still
> in Seattle.  ;-)

Thank you, and yes, I'm still in Seattle.  I was able to finish defer/
translation today thanks to the holiday.  And thank you again for your
contributions to the world that you made this year!  Happy Thanksgiving! :D


Thanks,
SJ

[...]
