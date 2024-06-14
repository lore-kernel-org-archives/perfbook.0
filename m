Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5819D880
	for <perfbook@vger.kernel.org>; Fri, 14 Jun 2024 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718336010; cv=none; b=rQ09nEx9OlgKRox5IMZm5S+5tkfmyHQ9pZmLFygsnsNObEHrtDgyV0z2KaJPNM5te3/I4JxQ/vMkwjKjgq9oBE6zjzxHYl3kmSqT5NZZPqD034we/Jcr68+R8eOY8TmdhdK4q6l5RnqAicS8xAqmr+GHZAH7SRzT8RWA7uhXwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718336010; c=relaxed/simple;
	bh=z2LipFSImyo+5ZJG+nAI4DyOLeaSF4zX7MaPfd5A7To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLpLpOqeC6TsLLT5PnZHwF4Z78bZ9T64wGEt8enrNoa6aNiXzSxEe5QRoQssFdlNWG3UEMSIxV6z2SM8hto40dneK/Sb8Fbqm+5V9m74vd+MKyZEhQFxRhYQnp1kknZYnFKjp7CvxRX4+xGWkg/b82o1JghL9n3N8oeX67wbZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpbtIWo1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpbtIWo1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312AFC2BBFC;
	Fri, 14 Jun 2024 03:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718336010;
	bh=z2LipFSImyo+5ZJG+nAI4DyOLeaSF4zX7MaPfd5A7To=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=JpbtIWo1R9CP2edVSE7/pljTGnp91GwP+tAvLtDsMcxmqBTtERvvYb7kr6Mf3NRsu
	 uOlYLoyNx+z8DhbhnvirjF02Mw4m7mViXTN4eMx/O7XUWKhnVIodeUPuqWL+VB1i1g
	 fr1Ch1AhC4Xr2wMzUBX2SrP0O42RWBM3CQPc41bhR41NdF1WfbRw4nhYN3RYYM4asF
	 MSEPqpNx7KQfnA5tikkQhWKnsYG9lZyR5+Ib9ctGNcfwWR4avTsziHPQBiSm/aBrZ1
	 mjnvt5F8vWMaf11/PSD+fms5NVzkKavTFZswNjhJpuBuB+0cAkvbbo3Y6sRmmVZ/uH
	 IkRne9GqcnybQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BC8D0CE094C; Thu, 13 Jun 2024 20:33:29 -0700 (PDT)
Date: Thu, 13 Jun 2024 20:33:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook v2 0/3] Work around backward incompatible
 changes in LaTeX2e 2024-06-01
Message-ID: <623ce21b-9898-408f-955f-0b35a9504307@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
 <c461a45b-2722-4412-8bfa-a987613ad182@paulmck-laptop>
 <c342046b-e078-4447-92ef-d692dce09fad@gmail.com>
 <b538307f-dc77-4015-931c-a3ffed159acf@paulmck-laptop>
 <0bed2ebf-ebf6-43fe-8a67-52d9c33cb422@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bed2ebf-ebf6-43fe-8a67-52d9c33cb422@gmail.com>

On Fri, Jun 14, 2024 at 11:12:27AM +0900, Akira Yokosawa wrote:
> On Wed, 12 Jun 2024 16:04:36 -0700, Paul E. McKenney wrote:
> > On Thu, Jun 13, 2024 at 08:01:44AM +0900, Akira Yokosawa wrote:
> >> On Tue, 11 Jun 2024 05:55:13 -0700, Paul E. McKenney wrote:
> >>> On Tue, Jun 11, 2024 at 06:34:25PM +0900, Akira Yokosawa wrote:
> >>>> Hi Paul,
> >>>>
> >>>> As I mentioned earlier [1], recent updates in core LaTeX and accompanying
> >>>> changes in the array package broke build of perfbook.
> >>>>
> >>>> There are two modes of incompatibilities.
> >>>>
> >>>>   1. arydshln assumes array's internal implementation of a past version of
> >>>>      array, which is no longer true with array >=v2.6.
> >>>>
> >>>>   2. A "LaTeX Warning:" message in loading parnotes.sty.
> >>>>
> >>>> Neither arydshln nor parnotes is actively maintained, so here are
> >>>> workarounds made in perfbook-lt.tex.
> >>>>
> >>>> Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
> >>>> earlier.
> >>>>
> >>>> Patch 2/3 enables a silence filter for the particular warning.
> >>>>
> >>>> Patch 3/3 is a follow up change to use date as rollback options of
> >>>> glossaries related packages.  By saying [=2022-10-01] rather than
> >>>> [=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
> >>>> well with our custom code for glossaries & indexing.
> >>>>
> >>>> [1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/
> >>>
> >>> Queued, thank you!
> >>>
> >>> I have to ask...  Longer term, are we going to need to be thinking in
> >>> terms of avoiding use of these two packages?  (I have no idea whether
> >>> that even makes any sense, but again, I have to ask.)
> >>
> >> Well, I have faint hope that Frank Mittelbach, the author of
> >> TLC3 (The LaTeX Companion, 3rd edition) and the maintainer of array
> >> (among others), might want to update those packages, as the book uses
> >> arydshln and parnotes in a couple of examples.
> >>
> >> Just hoping. ;-)
> > 
> > Me too!  ;-)
> 
> Good news.
> 
> I've got parnotes v3c in today's update of vanilla TeX Live 2024.
> It fixes that "harmless" warning.  Frank is kind enough and takes care of
> parnotes as a temporary caretaker [1].

Very good, thank you!

> Can you please drop 2/3 unless it is too late?
> 
> [1]: https://mirrors.ctan.org/macros/latex/contrib/parnotes/README.md

Given that I forgot to push your series out, no problem at all!

Please let me know if what is pushed now is what you expected.

						Thanx, Paul
