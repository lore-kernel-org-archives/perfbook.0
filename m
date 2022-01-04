Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiADAFI (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 3 Jan 2022 19:05:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0371EC061761
        for <perfbook@vger.kernel.org>; Mon,  3 Jan 2022 16:05:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8AB2361250
        for <perfbook@vger.kernel.org>; Tue,  4 Jan 2022 00:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641254707;
        bh=Oqt89hNad/0UlO+SQJ9K14GuI+qftKINOBuL5fWU38g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=t4Ut/MLp0U6fJ8xrzOGjaUjqle/1oSTyvPMtuOKxwqpbsuuiKqCdUSiD6oHabLBgg
         QnMvkv3sRb2DQPGvKRKNn7aNjI8U06GyITrjUuSxB7Z6czwScLnbbnNbKoAHNjM6c5
         Rf+eudRCDdjL3YsEvyn3p/1go7CmzKYReWNC6BRL/MYAFoGhFvmjt9Fn0LT+8HQ7c4
         9v5wC3Ne5VPmXewxvs13st/C5gIVMfg1NdiZHYj+rE5zfWRskESCGOEWEiTESDeW4U
         Owm/MtSlKJHjnCCH4nc7KsjIe/Jck3wWQ3mSnL4eHX4RSOCPRXYieK4aWOsrSrjIpU
         gyculIHgqIe0g==
Date: Mon, 3 Jan 2022 16:05:06 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
Message-ID: <20220104000506.GD4202@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
 <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com>
 <5be72d6b-54e8-4ac2-dd8d-cb9a8fd2d436@gmail.com>
 <20211222181927.GK4109570@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FUHcqEXE+MgXif0n=e09xYFoGFfmhjvY1=pnC6QCCRh2w@mail.gmail.com>
 <20211223022957.GM4109570@paulmck-ThinkPad-P17-Gen-1>
 <b2c80a98-ed14-7e0d-c309-3f3ea029018a@gmail.com>
 <CAJbg=FXxhA1d23EzAG2TfnyxVVd58khApBerH4vdU99FYwepuQ@mail.gmail.com>
 <50fb6c6c-cc9b-691e-b08b-233fd1a02001@gmail.com>
 <CAJbg=FUXcd4MLS0QxHV9rG=WwjEzsCo0Q2WuLUJC1-meygCu=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FUXcd4MLS0QxHV9rG=WwjEzsCo0Q2WuLUJC1-meygCu=g@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

First, apologies for the delay.  And happy new year!

On Thu, Dec 23, 2021 at 09:26:23AM -0500, Elad Lahav wrote:
> OK, here goes.
> The attached code corresponds to my understanding of the generic form
> of RCU. Note the complete absence of any pointers or a single data
> structure to hold the variables protected by the RCU critical section.
> Section 9.5 deals (for the most part) with one possible
> implementation, albeit one that seems to be the easiest and probably
> most efficient: the version identifier is an address of a data
> structure allocated on a heap and the tags correspond to fields within
> this data structure. Nevertheless, it is possible to come up with a
> different implementation, e.g., a database-like set of records
> consisting of <version, tag, value> tuples.

You lost me here.  How is the address of a data structure different
than a pointer?  Conceptually, from a high-level-language viewpoint,
sure, I can see it (not that I always like it, pointer zap being a prime
offender), but at the machine level I do not.

All that aside, there have been tuple-like data structures built on RCU,
for example:

@inproceedings{Mao:2012:CCF:2168836.2168855,
 author = {Mao, Yandong and Kohler, Eddie and Morris, Robert Tappan},
 title = {Cache Craftiness for Fast Multicore Key-value Storage},
 booktitle = {Proceedings of the 7th ACM European Conference on Computer Systems},
 series = {EuroSys '12},
 year = {2012},
 isbn = {978-1-4503-1223-3},
 location = {Bern, Switzerland},
 pages = {183--196},
 numpages = {14},
 url = {http://doi.acm.org/10.1145/2168836.2168855},
 doi = {10.1145/2168836.2168855},
 acmid = {2168855},
 publisher = {ACM},
 address = {New York, NY, USA},
 keywords = {in-memory, key-value, multicore, persistent},
}

> It is clear that rcu_set_latest_version() needs to impose memory order
> to prevent the new version being observed by a reader before the tags
> have been given the new values. It should also be clear that the read
> side requires ordering to prevent the values being read before the
> latest version is established. That said, even in my generic
> implementation this order is already present because of the data
> dependency between the version number and the rcu_read() calls. Unless
> there is a way to get rid of that dependency without losing the
> semantics of RCU it appears as though there really is no need for
> acquire semantics in general.

I agree that there is no need for acquire semantics in the common
case.  But care really is required.

First, compiler optimizations can sometimes break the dependency,
first by value-substitution optimizations:

	struct foo *gfp; // Assume non-NULL after initialization
	struct foo default_foo;

	int do_a_foo(struct foo *fp)
	{
		return munge_it(fp->a);
	}

The compiler (presumably in conjunction with feedback from a profiled
run) might convert this to:

	int do_a_foo(struct foo *fp)
	{
		if (fp == &default_foo)
			return munge_it(default_foo.a);
		else
			return munge_it(fp->a);
	}

This would break the dependency because control dependencies do not
order loads.  However, I would not expect compilers to do this in the
absence of feedback-directed optimization.

Second, and more concerning, things can get even more dicey when one
is trying to carry dependencies through integers:

	struct foo foo_array[N_FOOS];

	int do_a_foo(int i)
	{
		return munge_it(fp[i].a);
	}

This actually works well, at least until someone builds with N_FOOS=1,
which causes foo_array[] to reference a single element.  At that point,
the compiler is within its rights to transform to this:

	int do_a_foo(int i)
	{
		return munge_it(fp[0].a);
	}

This again breaks the dependency by substituting a constant.  (Note that
any non-zero index invokes undefined behavior, legalizing the otherwise
inexplicable substitution of the constant zero.)

In the Linux kernel, we deal with this sort of thing by knowing our
compilers (and their command-line flags) and through use of coding rules:
https://www.kernel.org/doc/Documentation/RCU/rcu_dereference.rst

> Thoughts?

And a question below on your sample code.

> --Elad
> 
> On Thu, 23 Dec 2021 at 07:59, Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > On Thu, 23 Dec 2021 07:46:02 -0500, Elad Lahav wrote:
> > > Yes, Akira, that's where I was going. Nevertheless, my question is a
> > > bit more profound than that: is the asymmetry a result of the
> > > implementation of RCU, as presented here (and the way it is used in
> > > the Linux kernel), or is it inherent to RCU as a data access pattern?
> > > I believe it is the former, and have an idea on how to phrase this
> > > notion more formally. I will write something up and you can then
> > > decide whether:
> > >
> > > 1. I'm wrong
> > > 2. I'm right, but it's not worth mentioning
> > > 3. I'm right, and the point should be added to the book
> > > 4. None of the above ;-)
> >
> > Nice!
> > Looking forward to seeing your write-up.
> >
> >         Thanks, Akira
> >
> > >
> > > --Elad
> > >
> > > On Thu, 23 Dec 2021 at 07:22, Akira Yokosawa <akiyks@gmail.com> wrote:
> > >>
> > >> Hi,
> > >>
> > >> It sounds to me like Paul is missing the main point of Elad's question.
> > >> So I'm chiming in again.  See inline comment below Elad's question.
> > >>
> > >> On Wed, 22 Dec 2021 18:29:57 -0800, Paul E. McKenney wrote:
> > >>> Strictly speaking, all that the rcu_read_lock()/rcu_read_unlock() does
> > >>> is to ensure that any RCU-protected linked data objects referenced by
> > >>> the corresponding critical section remain in existence for the full
> > >>> duration of that critical section.
> > >>>
> > >>> And even that overstates things a bit, as this describes not the
> > >>> underlying RCU API itself, but rather some of that API's use cases.
> > >>> (Though to be fair, these are the most popular of RCU's use cases.)
> > >>> So even more strictly speaking, all the rcu_read_lock()/rcu_read_unlock()
> > >>> does is to make any synchronize_rcu() or call_rcu() invocations starting
> > >>> after a given rcu_read_lock() wait (synchronously or asynchronously,
> > >>> respectively) until the corresponding rcu_read_unlock() is reached.
> > >>>
> > >>> Returning back to the first paragraph, additional protections can be
> > >>> arranged, depending on the RCU use case.  For example, if the non-pointer
> > >>> fields of objects added to an RCU-protected linked data structure remain
> > >>> unchanged while that object is accessible to readers, then the protection
> > >>> includes not just existence, but also value.  And there are other use
> > >>> cases where those values might change while accessible to readers.
> > >>>
> > >>> So the most accurate answer to your question is "That is a design
> > >>> choice, based on the RCU use case in question."
> > >>>
> > >>> My guess is that you are thinking in terms of designs where the
> > >>> non-pointer fields of an object are constant while that object is
> > >>> accessible to readers.  Is my guess correct?
> > >>>
> > >>>                                                       Thanx, Paul
> > >>>
> > >>> On Wed, Dec 22, 2021 at 04:35:24PM -0500, Elad Lahav wrote:
> > >>>> I will try to come up with something, but first I wanted to get your
> > >>>> opinion as to whether this design pattern, where you need to
> > >>>> dereference a pointer to a data structure containing all of the data
> > >>>> considered to be protected by the critical section, is inherent to
> > >>>> RCU, or is it just an idiosyncrasy of the implementation used in the
> > >>>> Linux kernel?
> > >>>>
> > >>>> --Elad
> > >>
> > >> I guess Elad is asking more of the design choice of rcu_assign_pointer()
> > >> and rcu_dereference().
> > >>
> > >> A naive reader might easily miss the asymmetry of rcu_assign_pointer()
> > >> with store-release and rcu_defeference() *without* load-acquire.
> > >>
> > >> IIUC, this asymmetry comes from the use cases where RCU performs best,
> > >> that is read-mostly.  Therefore, rcu_dereference() need to be
> > >> light-weight as possible and doesn't imply load-acquire.
> > >> Thankfully quite a lot of use cases can be covered by the pattern
> > >> where address-dependency is sufficient for read-side.
> > >>
> > >> So one approach for Elad's concern would be to add a Quick Quiz on
> > >> this asymmetry, I suppose.
> > >>
> > >> Elad, am I guessing right?
> > >>
> > >> Sidenote: RCU and memory accesses are orthogonal.  You can use whatever
> > >> memory access primitives for your needed memory ordering. (Which would
> > >> be quite likely a tricky thing to do for a naive reader, though.)
> > >>
> > >>         Thanks, Akira
> > >>
> > >>>>
> > >>>> On Wed, 22 Dec 2021 at 13:19, Paul E. McKenney <paulmck@kernel.org> wrote:
> > >>>>>
> > >>>>> On Wed, Dec 22, 2021 at 11:35:02PM +0900, Akira Yokosawa wrote:
> > >>>>>> Hi,
> > >>>>>>
> > >>>>>> On Wed, 22 Dec 2021 07:15:54 -0500, Elad Lahav wrote:
> > >>>>>>> Hi Akira,
> > >>>>>>>
> > >>>>>>>> I think this is mostly covered in Section 9.5.2.1 "Publish-Subscribe
> > >>>>>>>> Mechanism" and Figure 9.10 "Publication/Subscription Constraints".
> > >>>>>>>
> > >>>>>>> I don't believe it is. I think you can infer that from reading sections 9.5
> > >>>>>>> and chapter 15, but it is never made explicit.
> > >>>>>>
> > >>>>>> I agree it is not explicit.
> > >>>>>>
> > >>>>>>>
> > >>>>>>> Sub-section 9.5.2.1 talks about the use of rcu_dereference() to obtain a
> > >>>>>>> pointer, but it doesn't go very deep into how that's implemented. You would
> > >>>>>>> think that the writer's use of store-release semantics would necessitate
> > >>>>>>> the reader's use of load-acquire semantics, but the discussion here, the
> > >>>>>>> previous examples, and a quick inspection of how rcu_dereference() is
> > >>>>>>> implemented, suggest that a READ_ONCE() is sufficient (or some less
> > >>>>>>> Linux-kernel-specific equivalent).
> > >>>>>>>
> > >>>>>>> If I am a naive reader (and a lazy one, who haven't read chapter 15 and made
> > >>>>>>> the necessary connection), I could write something like:
> > >>>>>>>
> > >>>>>>>     struct foo_s {
> > >>>>>>>         int a;
> > >>>>>>>     } foo;
> > >>>>>>>     int b;
> > >>>>>>>     struct foo_s *g_foop = &foo;
> > >>>>>>>
> > >>>>>>>     // Reader
> > >>>>>>>     rcu_read_lock();
> > >>>>>>>     struct foo *l_foop = rcu_dereference(g_foop);
> > >>>>>>>     use(l_foop->a);
> > >>>>>>>     use(b);
> > >>>>>>>     rcu_read_unlock();
> > >>>>>>>
> > >>>>>>>     // Writer
> > >>>>>>>     struct foo *l_foop = malloc(sizeof(struct foo));
> > >>>>>>>     l_foop->a = 1;
> > >>>>>>>     b = 2;
> > >>>>>>>     // Release semantics ensure previous stores are observed
> > >>>>>>>     rcu_assign_pointer(g_foop, l_foop);
> > >>>>>>>
> > >>>>>>> But since b has no address dependency to g_foop and since neither
> > >>>>>>> rcu_read_lock() nor rcu_dereference() impose acquire semantics, then
> > >>>>>>> the reader may not observe the new value of b.
> > >>>>>>
> > >>>>>> No, it may not.
> > >>>>>> So what you want is the mention of "address dependency" somewhere in
> > >>>>>> Section 9.5.2.1?
> > >>>>>>
> > >>>>>>>
> > >>>>>>> Again, I may be missing something, but this seems to be a major point
> > >>>>>>> that needs to be explained and emphasized.
> > >>>>>>
> > >>>>>> I guess Paul is intentionally avoiding discussions on memory ordering
> > >>>>>> here in Section 9.5.
> > >>>>>>
> > >>>>>> Such a discussion would easily frighten naive readers...
> > >>>>>>
> > >>>>>> Anyway, I guess Paul would have some good compromise to satisfy you.
> > >>>>>
> > >>>>> Actually, I am going to ask Elad to propose the location and wording of an
> > >>>>> addition to Section 9.5 covering this, so that we can discuss and refine
> > >>>>> it.  This addition might be a new paragraph, a footnote, a quick quiz,
> > >>>>> a citation, or what have you.  And the refining might switch back and
> > >>>>> forth among these options a few times.  But we do have to start somewhere.
> > >>>>>
> > >>>>> I am thinking in terms of this going in after the release that I was
> > >>>>> naively planning to do yesterday.  (The objective universe had other
> > >>>>> ideas.)
> > >>>>>
> > >>>>>>>> BTW, I couldn't figure out what you meant by "the Spanish
> > >>>>>>>> Acquisition"...
> > >>>>>>> It's a reference to an old Monty Python skit. Apologies for the silly pun...
> > >>>>>>
> > >>>>>> Ah, now I guess I see the pun of "acquire" and "acquisition".  ;-)
> > >>>>>
> > >>>>> And here I was hoping that Elad was purchasing a house in Barcelona
> > >>>>> or some such.  ;-)
> > >>>>>
> > >>>>> (Sorry, couldn't resist!)
> > >>>>>
> > >>>>>                                                         Thanx, Paul

> #include <rcu.h>
> 
> // These tags represent variables protected by the RCU critical section.
> // The variables are versioned: every version associates each variable with a
> // value.
> rcu_data_tag_t tag1;
> rcu_data_tag_t tag2;
> 
> void
> reader()
> {
>     // Enter the critical section.
>     rcu_reader_enter();
> 
>     // Get the values corresponding to the latest version this reader observes.
>     rcu_version_t latest = rcu_get_latest_version();
>     rcu_value_t value1 = rcu_read(tag1, latest);
>     rcu_value_t value2 = rcu_read(tag1, latest);
> 
>     // Use value1 and value2
> 
>     // Let any writer know that this reader no longer requires this version of
>     // the values.
>     rcu_release_version(latest);

Why is this needed?  What is provided by this that is not covered by
rcu_reader_exit(), AKA rcu_read_unlock()?

If rcu_get_latest_version() is allocating memory or some such, then
it can be passed to call_rcu() just after allocation to cause it to be
freed when it is safe to do so.  This approach relieves the developer
from the need to figure out where to put all of the required invocations
of rcu_release_version().  And in this simple example, it is easy to
see where to put it, but in large examples spanning functions (to say
nothing of translation units), it is not always so easy.

Or are you instead thinking in terms of reference-counted structures?

							Thanx, Paul

>     // Exit the critical section.
>     rcu_reader_exit();
> }
> 
> void
> writer()
> {
>     // Enter the critical section.
>     rcu_writer_enter();
> 
>     // Create a new version identifier.
>     rcu_version_t old_version = rcu_get_latest_version();
>     rcu_version_t new_version = rcu_create_version();
> 
>     // Provide new values for this version.
>     rcu_value_t new_value1 = SOME_VALUE_1;
>     rcu_value_t new_value2 = SOME_VALUE_2;
>     rcu_write(tag1, new_value1, new_version);
>     rcu_write(tag2, new_value2, new_version);
> 
>     // Publish the new version.
>     rcu_set_latest_version(new_version);
> 
>     // Optional:
>     // Wait for readers to stop using the old version and then discard it.
>     rcu_wait_readers(old_version);
>     rcu_remove_version(old_version);
> 
>     // Exit the critical section.
>     rcu_writer_exit();
> }

