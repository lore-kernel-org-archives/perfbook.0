Return-Path: <SRS0=L8lv=RI=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i79xu9OYWojdhDC5qEbSN1aWQwv07fbAGLf3GtH60/w=;
        b=mjvBuEfGLhvuhCviSiWHt8SzMghLlSPjdEz8S1zcjDKnMpu+iyG/xYXEb22jeC2a03
         4uoHfQXcnMq44nbpxQXrPANkVpzLyZeOfo8bi6IL7+ykxquzNyEeRRKlhRAXd+IKTUa4
         IaFPK1LhiC7CpOhb3MbKiYt0JVuuHbAmDgMzJ5wAk8wgrZrciNv2YkKabL+8y0Q9m38i
         p0NxaGj+5pgTvdTpaQobAYmZQlByRh4qIopre6m7yMleY8FFZDrveflAjVdChqFsgS/w
         5mxWo4r9lobN1tmJPH5l4M394VP1wHnOuRBoERkcMmvwOW6H3YZbuvOKnsU2mgWmSyZM
         sIvw==
MIME-Version: 1.0
References: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
 <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com> <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com>
 <5be72d6b-54e8-4ac2-dd8d-cb9a8fd2d436@gmail.com> <20211222181927.GK4109570@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FUHcqEXE+MgXif0n=e09xYFoGFfmhjvY1=pnC6QCCRh2w@mail.gmail.com>
 <20211223022957.GM4109570@paulmck-ThinkPad-P17-Gen-1> <b2c80a98-ed14-7e0d-c309-3f3ea029018a@gmail.com>
 <CAJbg=FXxhA1d23EzAG2TfnyxVVd58khApBerH4vdU99FYwepuQ@mail.gmail.com> <50fb6c6c-cc9b-691e-b08b-233fd1a02001@gmail.com>
In-Reply-To: <50fb6c6c-cc9b-691e-b08b-233fd1a02001@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Thu, 23 Dec 2021 09:26:23 -0500
Message-ID: <CAJbg=FUXcd4MLS0QxHV9rG=WwjEzsCo0Q2WuLUJC1-meygCu=g@mail.gmail.com>
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
Content-Type: multipart/mixed; boundary="000000000000bde2f905d3d106e2"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--000000000000bde2f905d3d106e2
Content-Type: text/plain; charset="UTF-8"

OK, here goes.
The attached code corresponds to my understanding of the generic form
of RCU. Note the complete absence of any pointers or a single data
structure to hold the variables protected by the RCU critical section.
Section 9.5 deals (for the most part) with one possible
implementation, albeit one that seems to be the easiest and probably
most efficient: the version identifier is an address of a data
structure allocated on a heap and the tags correspond to fields within
this data structure. Nevertheless, it is possible to come up with a
different implementation, e.g., a database-like set of records
consisting of <version, tag, value> tuples.
It is clear that rcu_set_latest_version() needs to impose memory order
to prevent the new version being observed by a reader before the tags
have been given the new values. It should also be clear that the read
side requires ordering to prevent the values being read before the
latest version is established. That said, even in my generic
implementation this order is already present because of the data
dependency between the version number and the rcu_read() calls. Unless
there is a way to get rid of that dependency without losing the
semantics of RCU it appears as though there really is no need for
acquire semantics in general.

Thoughts?

--Elad

On Thu, 23 Dec 2021 at 07:59, Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On Thu, 23 Dec 2021 07:46:02 -0500, Elad Lahav wrote:
> > Yes, Akira, that's where I was going. Nevertheless, my question is a
> > bit more profound than that: is the asymmetry a result of the
> > implementation of RCU, as presented here (and the way it is used in
> > the Linux kernel), or is it inherent to RCU as a data access pattern?
> > I believe it is the former, and have an idea on how to phrase this
> > notion more formally. I will write something up and you can then
> > decide whether:
> >
> > 1. I'm wrong
> > 2. I'm right, but it's not worth mentioning
> > 3. I'm right, and the point should be added to the book
> > 4. None of the above ;-)
>
> Nice!
> Looking forward to seeing your write-up.
>
>         Thanks, Akira
>
> >
> > --Elad
> >
> > On Thu, 23 Dec 2021 at 07:22, Akira Yokosawa <akiyks@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> It sounds to me like Paul is missing the main point of Elad's question.
> >> So I'm chiming in again.  See inline comment below Elad's question.
> >>
> >> On Wed, 22 Dec 2021 18:29:57 -0800, Paul E. McKenney wrote:
> >>> Strictly speaking, all that the rcu_read_lock()/rcu_read_unlock() does
> >>> is to ensure that any RCU-protected linked data objects referenced by
> >>> the corresponding critical section remain in existence for the full
> >>> duration of that critical section.
> >>>
> >>> And even that overstates things a bit, as this describes not the
> >>> underlying RCU API itself, but rather some of that API's use cases.
> >>> (Though to be fair, these are the most popular of RCU's use cases.)
> >>> So even more strictly speaking, all the rcu_read_lock()/rcu_read_unlock()
> >>> does is to make any synchronize_rcu() or call_rcu() invocations starting
> >>> after a given rcu_read_lock() wait (synchronously or asynchronously,
> >>> respectively) until the corresponding rcu_read_unlock() is reached.
> >>>
> >>> Returning back to the first paragraph, additional protections can be
> >>> arranged, depending on the RCU use case.  For example, if the non-pointer
> >>> fields of objects added to an RCU-protected linked data structure remain
> >>> unchanged while that object is accessible to readers, then the protection
> >>> includes not just existence, but also value.  And there are other use
> >>> cases where those values might change while accessible to readers.
> >>>
> >>> So the most accurate answer to your question is "That is a design
> >>> choice, based on the RCU use case in question."
> >>>
> >>> My guess is that you are thinking in terms of designs where the
> >>> non-pointer fields of an object are constant while that object is
> >>> accessible to readers.  Is my guess correct?
> >>>
> >>>                                                       Thanx, Paul
> >>>
> >>> On Wed, Dec 22, 2021 at 04:35:24PM -0500, Elad Lahav wrote:
> >>>> I will try to come up with something, but first I wanted to get your
> >>>> opinion as to whether this design pattern, where you need to
> >>>> dereference a pointer to a data structure containing all of the data
> >>>> considered to be protected by the critical section, is inherent to
> >>>> RCU, or is it just an idiosyncrasy of the implementation used in the
> >>>> Linux kernel?
> >>>>
> >>>> --Elad
> >>
> >> I guess Elad is asking more of the design choice of rcu_assign_pointer()
> >> and rcu_dereference().
> >>
> >> A naive reader might easily miss the asymmetry of rcu_assign_pointer()
> >> with store-release and rcu_defeference() *without* load-acquire.
> >>
> >> IIUC, this asymmetry comes from the use cases where RCU performs best,
> >> that is read-mostly.  Therefore, rcu_dereference() need to be
> >> light-weight as possible and doesn't imply load-acquire.
> >> Thankfully quite a lot of use cases can be covered by the pattern
> >> where address-dependency is sufficient for read-side.
> >>
> >> So one approach for Elad's concern would be to add a Quick Quiz on
> >> this asymmetry, I suppose.
> >>
> >> Elad, am I guessing right?
> >>
> >> Sidenote: RCU and memory accesses are orthogonal.  You can use whatever
> >> memory access primitives for your needed memory ordering. (Which would
> >> be quite likely a tricky thing to do for a naive reader, though.)
> >>
> >>         Thanks, Akira
> >>
> >>>>
> >>>> On Wed, 22 Dec 2021 at 13:19, Paul E. McKenney <paulmck@kernel.org> wrote:
> >>>>>
> >>>>> On Wed, Dec 22, 2021 at 11:35:02PM +0900, Akira Yokosawa wrote:
> >>>>>> Hi,
> >>>>>>
> >>>>>> On Wed, 22 Dec 2021 07:15:54 -0500, Elad Lahav wrote:
> >>>>>>> Hi Akira,
> >>>>>>>
> >>>>>>>> I think this is mostly covered in Section 9.5.2.1 "Publish-Subscribe
> >>>>>>>> Mechanism" and Figure 9.10 "Publication/Subscription Constraints".
> >>>>>>>
> >>>>>>> I don't believe it is. I think you can infer that from reading sections 9.5
> >>>>>>> and chapter 15, but it is never made explicit.
> >>>>>>
> >>>>>> I agree it is not explicit.
> >>>>>>
> >>>>>>>
> >>>>>>> Sub-section 9.5.2.1 talks about the use of rcu_dereference() to obtain a
> >>>>>>> pointer, but it doesn't go very deep into how that's implemented. You would
> >>>>>>> think that the writer's use of store-release semantics would necessitate
> >>>>>>> the reader's use of load-acquire semantics, but the discussion here, the
> >>>>>>> previous examples, and a quick inspection of how rcu_dereference() is
> >>>>>>> implemented, suggest that a READ_ONCE() is sufficient (or some less
> >>>>>>> Linux-kernel-specific equivalent).
> >>>>>>>
> >>>>>>> If I am a naive reader (and a lazy one, who haven't read chapter 15 and made
> >>>>>>> the necessary connection), I could write something like:
> >>>>>>>
> >>>>>>>     struct foo_s {
> >>>>>>>         int a;
> >>>>>>>     } foo;
> >>>>>>>     int b;
> >>>>>>>     struct foo_s *g_foop = &foo;
> >>>>>>>
> >>>>>>>     // Reader
> >>>>>>>     rcu_read_lock();
> >>>>>>>     struct foo *l_foop = rcu_dereference(g_foop);
> >>>>>>>     use(l_foop->a);
> >>>>>>>     use(b);
> >>>>>>>     rcu_read_unlock();
> >>>>>>>
> >>>>>>>     // Writer
> >>>>>>>     struct foo *l_foop = malloc(sizeof(struct foo));
> >>>>>>>     l_foop->a = 1;
> >>>>>>>     b = 2;
> >>>>>>>     // Release semantics ensure previous stores are observed
> >>>>>>>     rcu_assign_pointer(g_foop, l_foop);
> >>>>>>>
> >>>>>>> But since b has no address dependency to g_foop and since neither
> >>>>>>> rcu_read_lock() nor rcu_dereference() impose acquire semantics, then
> >>>>>>> the reader may not observe the new value of b.
> >>>>>>
> >>>>>> No, it may not.
> >>>>>> So what you want is the mention of "address dependency" somewhere in
> >>>>>> Section 9.5.2.1?
> >>>>>>
> >>>>>>>
> >>>>>>> Again, I may be missing something, but this seems to be a major point
> >>>>>>> that needs to be explained and emphasized.
> >>>>>>
> >>>>>> I guess Paul is intentionally avoiding discussions on memory ordering
> >>>>>> here in Section 9.5.
> >>>>>>
> >>>>>> Such a discussion would easily frighten naive readers...
> >>>>>>
> >>>>>> Anyway, I guess Paul would have some good compromise to satisfy you.
> >>>>>
> >>>>> Actually, I am going to ask Elad to propose the location and wording of an
> >>>>> addition to Section 9.5 covering this, so that we can discuss and refine
> >>>>> it.  This addition might be a new paragraph, a footnote, a quick quiz,
> >>>>> a citation, or what have you.  And the refining might switch back and
> >>>>> forth among these options a few times.  But we do have to start somewhere.
> >>>>>
> >>>>> I am thinking in terms of this going in after the release that I was
> >>>>> naively planning to do yesterday.  (The objective universe had other
> >>>>> ideas.)
> >>>>>
> >>>>>>>> BTW, I couldn't figure out what you meant by "the Spanish
> >>>>>>>> Acquisition"...
> >>>>>>> It's a reference to an old Monty Python skit. Apologies for the silly pun...
> >>>>>>
> >>>>>> Ah, now I guess I see the pun of "acquire" and "acquisition".  ;-)
> >>>>>
> >>>>> And here I was hoping that Elad was purchasing a house in Barcelona
> >>>>> or some such.  ;-)
> >>>>>
> >>>>> (Sorry, couldn't resist!)
> >>>>>
> >>>>>                                                         Thanx, Paul

--000000000000bde2f905d3d106e2
Content-Type: text/x-csrc; charset="US-ASCII"; name="rcu_generic.c"
Content-Disposition: attachment; filename="rcu_generic.c"
Content-Transfer-Encoding: base64
Content-ID: <f_kxj25n7y0>
X-Attachment-Id: f_kxj25n7y0

I2luY2x1ZGUgPHJjdS5oPgoKLy8gVGhlc2UgdGFncyByZXByZXNlbnQgdmFyaWFibGVzIHByb3Rl
Y3RlZCBieSB0aGUgUkNVIGNyaXRpY2FsIHNlY3Rpb24uCi8vIFRoZSB2YXJpYWJsZXMgYXJlIHZl
cnNpb25lZDogZXZlcnkgdmVyc2lvbiBhc3NvY2lhdGVzIGVhY2ggdmFyaWFibGUgd2l0aCBhCi8v
IHZhbHVlLgpyY3VfZGF0YV90YWdfdCB0YWcxOwpyY3VfZGF0YV90YWdfdCB0YWcyOwoKdm9pZApy
ZWFkZXIoKQp7CiAgICAvLyBFbnRlciB0aGUgY3JpdGljYWwgc2VjdGlvbi4KICAgIHJjdV9yZWFk
ZXJfZW50ZXIoKTsKCiAgICAvLyBHZXQgdGhlIHZhbHVlcyBjb3JyZXNwb25kaW5nIHRvIHRoZSBs
YXRlc3QgdmVyc2lvbiB0aGlzIHJlYWRlciBvYnNlcnZlcy4KICAgIHJjdV92ZXJzaW9uX3QgbGF0
ZXN0ID0gcmN1X2dldF9sYXRlc3RfdmVyc2lvbigpOwogICAgcmN1X3ZhbHVlX3QgdmFsdWUxID0g
cmN1X3JlYWQodGFnMSwgbGF0ZXN0KTsKICAgIHJjdV92YWx1ZV90IHZhbHVlMiA9IHJjdV9yZWFk
KHRhZzEsIGxhdGVzdCk7CgogICAgLy8gVXNlIHZhbHVlMSBhbmQgdmFsdWUyCgogICAgLy8gTGV0
IGFueSB3cml0ZXIga25vdyB0aGF0IHRoaXMgcmVhZGVyIG5vIGxvbmdlciByZXF1aXJlcyB0aGlz
IHZlcnNpb24gb2YKICAgIC8vIHRoZSB2YWx1ZXMuCiAgICByY3VfcmVsZWFzZV92ZXJzaW9uKGxh
dGVzdCk7CgogICAgLy8gRXhpdCB0aGUgY3JpdGljYWwgc2VjdGlvbi4KICAgIHJjdV9yZWFkZXJf
ZXhpdCgpOwp9Cgp2b2lkCndyaXRlcigpCnsKICAgIC8vIEVudGVyIHRoZSBjcml0aWNhbCBzZWN0
aW9uLgogICAgcmN1X3dyaXRlcl9lbnRlcigpOwoKICAgIC8vIENyZWF0ZSBhIG5ldyB2ZXJzaW9u
IGlkZW50aWZpZXIuCiAgICByY3VfdmVyc2lvbl90IG9sZF92ZXJzaW9uID0gcmN1X2dldF9sYXRl
c3RfdmVyc2lvbigpOwogICAgcmN1X3ZlcnNpb25fdCBuZXdfdmVyc2lvbiA9IHJjdV9jcmVhdGVf
dmVyc2lvbigpOwoKICAgIC8vIFByb3ZpZGUgbmV3IHZhbHVlcyBmb3IgdGhpcyB2ZXJzaW9uLgog
ICAgcmN1X3ZhbHVlX3QgbmV3X3ZhbHVlMSA9IFNPTUVfVkFMVUVfMTsKICAgIHJjdV92YWx1ZV90
IG5ld192YWx1ZTIgPSBTT01FX1ZBTFVFXzI7CiAgICByY3Vfd3JpdGUodGFnMSwgbmV3X3ZhbHVl
MSwgbmV3X3ZlcnNpb24pOwogICAgcmN1X3dyaXRlKHRhZzIsIG5ld192YWx1ZTIsIG5ld192ZXJz
aW9uKTsKCiAgICAvLyBQdWJsaXNoIHRoZSBuZXcgdmVyc2lvbi4KICAgIHJjdV9zZXRfbGF0ZXN0
X3ZlcnNpb24obmV3X3ZlcnNpb24pOwoKICAgIC8vIE9wdGlvbmFsOgogICAgLy8gV2FpdCBmb3Ig
cmVhZGVycyB0byBzdG9wIHVzaW5nIHRoZSBvbGQgdmVyc2lvbiBhbmQgdGhlbiBkaXNjYXJkIGl0
LgogICAgcmN1X3dhaXRfcmVhZGVycyhvbGRfdmVyc2lvbik7CiAgICByY3VfcmVtb3ZlX3ZlcnNp
b24ob2xkX3ZlcnNpb24pOwoKICAgIC8vIEV4aXQgdGhlIGNyaXRpY2FsIHNlY3Rpb24uCiAgICBy
Y3Vfd3JpdGVyX2V4aXQoKTsKfQo=
--000000000000bde2f905d3d106e2--
