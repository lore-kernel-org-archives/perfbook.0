Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IZ/4B6nOC6mrGUJBwCAYlH6SUUIDK7UQjk4o0dAPyJI=;
        b=M+itZjDGjVPqvCoI/kwSN7DlQpgFUf+h9ZBA+CqVLBYjMI23E0TBvMTjuvlQtd6LHZ
         /i148ftEgOKi3YWgVcet718TKo+RnCuMa3ieCG7OSGnsY8BXYqwJ0mVzUtCFeSklYYVt
         TmEv5hbaL3t7rd6PCISYefchUDNJka6uqT9U08hK2c/sDiJGDJFKckZ1NofFqkAUGZyN
         OmgqqualJOQ1F6qbSRGI3JW2BNu0JbvVAUG8dIdKn1kIGFXGNRmf4vLCzL8B3jnrbhRx
         jtK7elgUcncC4m9oab7O1x5hC2uYE7ypDvFVXD5xnPylqjVU3EPHH9qXfbxyybnsgjwy
         oyjA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 5/5] debugging/debugging: s/remainder of a section/following sections/
Date: Sat, 11 Feb 2023 09:06:03 -0800
Message-Id: <20230211170603.9155-1-sj@kernel.org>
In-Reply-To: <20230206173344.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, SeongJae Park <sj@kernel.org>, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On Mon, 6 Feb 2023 09:33:44 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Mon, Feb 06, 2023 at 12:01:57PM +0900, Akira Yokosawa wrote:
> > On Sun,  5 Feb 2023 10:21:28 -0800, SeongJae Park wrote:
> > > From: SeongJae Park <sj38.park@gmail.com>
> > > 
> > > A sectence in 'Microbenchmarking' section is mentioning the remainder of
> > > the section will look at ways for dealing with conflicts in measurement
> > > error advices, but those are not dealt in the remainder of the section
> > > but its following sections.  Fix the sentence.
> > > 
> > > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > > ---
> > >  debugging/debugging.tex | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> > > index 53c7fb94..225a4184 100644
> > > --- a/debugging/debugging.tex
> > > +++ b/debugging/debugging.tex
> > > @@ -2302,7 +2302,7 @@ to creep in, including:
> > >  
> > >  The first and fourth sources of interference provide conflicting advice,
> > >  which is one sign that we are living in the real world.
> > > -The remainder of this section looks at ways of resolving this conflict.
> > > +The following sections look at ways of resolving this conflict.
> > 
> > If you interpret "The remainder of this section" as "The remainder of
> > Section 11.6.4 'Hunting Heisenbugs'", there is nothing to fix.
> > 
> > We call all of section, subsection, and subsubsection as "Section",
> > which might be confusing sometimes, but I don't have any idea what
> > should be done here.
> 
> One approach would be to say something like this:
> 
> 	The remainder of this section (Section 11.6.4) looks at ways of
> 	resolving this conflict.
> 
> I am not sure whether or not this is a good idea, but perhaps either
> way it will inspire better ideas.

Thank you for nice suggestion.  Will follow your idea in the next spin.


Thanks,
SJ

> 
> 							Thanx, Paul
> 
> >         Thanks, Akira
> > 
> > >  
> > >  \QuickQuiz{
> > >  	But what about other sources of error, for example, due to
