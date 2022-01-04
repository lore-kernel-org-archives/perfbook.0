Return-Path: <SRS0=mOZy=RU=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6YuLOl+FjbXYGkSwdd4cIPSB8N1bM2poB+9sgI/HqdY=;
        b=d+haumaIv3EFnI+KRAV3xtE2kDLtSnHRQ8y3PAWGP177se3BqZSlX3PsQrPy4JWJPb
         /HcbZ8TkEk0m1G5GcwsrGM3uFQStMM4H/NhnXoRoxjDySRoeNV5jOqRBnrUb9jU3yKpU
         FEELu9ou13ORUYwK0+jSNwF4cSh7Avb8RzlEj6Dbk/6+DAWhazh/f/2w+fpCYZJWz3+c
         cYG58JMzZpla8rn9M6D9z9mrIpb6ummCIiSk3JwdkL7e3PuVSMQ/taEzfCb1d17vC0ZA
         qZAjCxx7/z1WUbSvX7d3r+F6hG1DTZJ7ijmD10WLLdtWh1wvl4ThaOHBcqayp2G2HItX
         l3Xw==
MIME-Version: 1.0
References: <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
 <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com> <5be72d6b-54e8-4ac2-dd8d-cb9a8fd2d436@gmail.com>
 <20211222181927.GK4109570@paulmck-ThinkPad-P17-Gen-1> <CAJbg=FUHcqEXE+MgXif0n=e09xYFoGFfmhjvY1=pnC6QCCRh2w@mail.gmail.com>
 <20211223022957.GM4109570@paulmck-ThinkPad-P17-Gen-1> <b2c80a98-ed14-7e0d-c309-3f3ea029018a@gmail.com>
 <CAJbg=FXxhA1d23EzAG2TfnyxVVd58khApBerH4vdU99FYwepuQ@mail.gmail.com>
 <50fb6c6c-cc9b-691e-b08b-233fd1a02001@gmail.com> <CAJbg=FUXcd4MLS0QxHV9rG=WwjEzsCo0Q2WuLUJC1-meygCu=g@mail.gmail.com>
 <20220104000506.GD4202@paulmck-ThinkPad-P17-Gen-1> <ae38a23a-a5ac-055f-3039-c10e46160e13@gmail.com>
In-Reply-To: <ae38a23a-a5ac-055f-3039-c10e46160e13@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Tue, 4 Jan 2022 06:47:42 -0500
Message-ID: <CAJbg=FULL3obUqKPKK=BD4o9Wr-WbcFH9GoAAFQ7Vh7EfqphtQ@mail.gmail.com>
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

> The tag is the address, the pointer is just a variable that holds that tag.
Sorry, I re-read what I wrote and it's not accurate. The tag *is* the
pointer variable, the address it holds is the version.

--Elad

On Mon, 3 Jan 2022 at 19:49, Elad Lahav <e2lahav@gmail.com> wrote:
>
> Hi Paul,
>
> On 2022-01-03 7:05 p.m., Paul E. McKenney wrote:
> > First, apologies for the delay.  And happy new year!
> No problem! I did not expect you to spend time on this during the
> holidays. Hope you had a good hike on Christmas eve. I would have liked
> to go hiking as well, but the combination of -20C and a raging pandemic
> restrict me to the treadmill.
>
> Your response makes me think that I need to explain better what I am
> trying to do here. Reading section 9.5 it is not always clear to me what
> constitutes a description of RCU and what a description of "RCU in the
> Linux kernel". I decided to try and come up with a more abstract
> description using the code I attached. It may be just a straw man, but
> at least it gives us something to point at while discussing (which I
> guess is a redundant definition of a "straw man"...).
>
> > You lost me here.  How is the address of a data structure different
> > than a pointer?  Conceptually, from a high-level-language viewpoint,
> > sure, I can see it (not that I always like it, pointer zap being a prime
> > offender), but at the machine level I do not.
> I'm just trying to correlate the "tag" nomenclature with the way the
> Linux kernel RCU implementation works. I believe that this
> implementation fits within the abstract code I wrote, relying on the
> heap to provide versioned data by doing its job, i.e., never return a
> version (address) that has not been released (freed). The tag is the
> address, the pointer is just a variable that holds that tag.
>
> > I agree that there is no need for acquire semantics in the common
> > case.  But care really is required.
> >
> > First, compiler optimizations can sometimes break the dependency,
> > first by value-substitution optimizations:
> >
> >       struct foo *gfp; // Assume non-NULL after initialization
> >       struct foo default_foo;
> >
> >       int do_a_foo(struct foo *fp)
> >       {
> >               return munge_it(fp->a);
> >       }
> >
> > The compiler (presumably in conjunction with feedback from a profiled
> > run) might convert this to:
> >
> >       int do_a_foo(struct foo *fp)
> >       {
> >               if (fp == &default_foo)
> >                       return munge_it(default_foo.a);
> >               else
> >                       return munge_it(fp->a);
> >       }
> >
> > This would break the dependency because control dependencies do not
> > order loads.  However, I would not expect compilers to do this in the
> > absence of feedback-directed optimization.
> >
> > Second, and more concerning, things can get even more dicey when one
> > is trying to carry dependencies through integers:
> >
> >       struct foo foo_array[N_FOOS];
> >
> >       int do_a_foo(int i)
> >       {
> >               return munge_it(fp[i].a);
> >       }
> >
> > This actually works well, at least until someone builds with N_FOOS=1,
> > which causes foo_array[] to reference a single element.  At that point,
> > the compiler is within its rights to transform to this:
> >
> >       int do_a_foo(int i)
> >       {
> >               return munge_it(fp[0].a);
> >       }
> >
> > This again breaks the dependency by substituting a constant.  (Note that
> > any non-zero index invokes undefined behavior, legalizing the otherwise
> > inexplicable substitution of the constant zero.)
>
> Excellent, that's what I was looking for! If I understand you correctly,
> in principle acquire semantics *are* required for the reader. It just so
> happens that most implementations can get away without explicit acquire
> semantics due to data or address dependencies, but these need to be
> justified.
>
> > Why is this needed?  What is provided by this that is not covered by
> > rcu_reader_exit(), AKA rcu_read_unlock()?
>
> Just for verbosity's sake. I first wrote it as
> "rcu_reader_exit(latest)", but I felt it wasn't clear what are the
> semantics of such a call. I guess something like
> "rcu_reader_release_and_exit(latest)" could work.
>
> --Elad
