Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA9D381D1
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710975755; cv=none; b=t8AAUA1E8bfQRl8QbjUu0NGSHjNHF/Acbh+quWqhztz6kyoUPvpN3j7FSG0wvOZkiB+mFx3LXg1EqvIR7gy8jUlOik4uuj+rTtWTe4XkoZX1C7HB+MUr1YWI4x774+xct19ocXssW4RG82tgdUmC0mcrQA8IJGsf1swKSV2J/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710975755; c=relaxed/simple;
	bh=SCMHx/qn22Uko+f/QGVndDsH1B3htAoyEUwKsXakd6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wg3EYF5OTb5SmxpTSDcvmoSuHeX/+ccujfyt6SrAVU7ncGq9x99igBPCQWIhVttY6B+BESfK+xHuFxlScmMlI0LSGTM2FQxWrQyW2sJJ1Vnm+LUdYbZxE9RAkLy7WSTb/XjJKh6ir7a8PVMRSwVNNhbzybdeVvA0NCdzzmTK514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3QHyu2E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3QHyu2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2E1C433C7;
	Wed, 20 Mar 2024 23:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710975754;
	bh=SCMHx/qn22Uko+f/QGVndDsH1B3htAoyEUwKsXakd6A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=j3QHyu2ElzTDJq3qw+ht+aIq7Sk+zfJu2M4+5nbzxgGw0VGPQgg4VsBxS5s2VzKei
	 Xty+kRKp9it9xAGLdlVNyogdtsTK/vqeddWQyjTOnXO7oP5BMtYQXUE2T1fFOq45li
	 XCwZV/HCgsI+atdW304cdTEVVbg2y6a2FKJV3R41oY2XN1ohzqKZLesRiL6PejK2o+
	 SP2kLtkQAn9lfIYtR8Q7OtTYjP/bTP5oQGobH5/SXmqyN6HD7lf3hmHwRp0iaX57LI
	 km4Gh3BR/rDbCUWcCsMg+ayMRi7VfIlsJikcMkMhpnSFAqQPxnWKUuCXqmjUWKZoCX
	 z5aBTxyDi7bAA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 64301CE0716; Wed, 20 Mar 2024 16:02:32 -0700 (PDT)
Date: Wed, 20 Mar 2024 16:02:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Guilherme Janczak <guilherme.janczak@yandex.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR
 sigatomic_t
Message-ID: <65c00ce1-8bc8-4e59-9113-b616fd7749da@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>

On Wed, Mar 20, 2024 at 08:25:23PM +0000, Guilherme Janczak wrote:
> Variables shared with signal handlers must be of type `volatile
> sigatomic_t`, not `volatile` or `sigatomic_t` as the current text says,
> according to a C11 draft:
> 
>     When ... interrupted by ... a signal, values of objects that are
>     neither lock-free atomic objects nor of type volatile sig_atomic_t
>     are unspecified.
> 
> Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
> Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
> ---
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 5c50d42d..873c3424 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread, at least at the
>  assembly-language level.
>  However, the C and C++ languages do not define the results of handlers
>  and interrupted threads sharing plain variables.
> -Instead, such shared variables must be \co{sig_atomic_t}, lock-free
> -atomics, or \co{volatile}.
> +Instead, such shared variables must be \co{volatile sig_atomic_t} or
> +lock-free atomics.

You might be right about "sig_atomic_t" needing to also be "volatile"
(I will let you and Elad settle your differences on this one), but if
device drivers are to work correctly, then volatile variables that are
machine-word sized and aligned must necessarily work for communication
between process-level code and interrupt/signal handlers.

							Thanx, Paul

>  On the other hand, because the handler executes within the interrupted
>  thread's context, the memory ordering used to synchronize communication
> -- 
> 2.42.0
> 
> 
