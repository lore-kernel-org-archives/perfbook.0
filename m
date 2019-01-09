Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34260 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727828AbfAIC7V (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 8 Jan 2019 21:59:21 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x092xKmV029877
        for <perfbook@vger.kernel.org>; Tue, 8 Jan 2019 21:59:20 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pw70tb655-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 08 Jan 2019 21:59:20 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 9 Jan 2019 02:59:17 -0000
Date: Tue, 8 Jan 2019 18:59:13 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Question regarding hash_resize
Reply-To: paulmck@linux.ibm.com
References: <CABoNC81XkNKv6=g2GUq4pNkwc4mcZ1FyZbjreD9KRfxQQUuPYg@mail.gmail.com>
 <20190107183317.GB1215@linux.ibm.com>
 <63181ff3-bcfa-0819-460a-867e438a22f7@gmail.com>
 <6d75361a-8a7f-1190-0c34-dccb7e2dea01@gmail.com>
 <CABoNC81zQw-qfd-7=RGNssos004f9+dp+nZvRGh4Udjc=j5YYQ@mail.gmail.com>
 <20190108152846.GN1215@linux.ibm.com>
 <b7ccf8ed-dc55-0b44-af2c-be2d31c7f6fd@gmail.com>
 <20190108183931.GR1215@linux.ibm.com>
 <288a7aca-75ba-d9ba-297b-5bbd98054d5f@gmail.com>
 <20190109001959.GS1215@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190109001959.GS1215@linux.ibm.com>
Message-Id: <20190109025913.GA7904@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Tue, Jan 08, 2019 at 04:19:59PM -0800, Paul E. McKenney wrote:
> On Wed, Jan 09, 2019 at 07:16:05AM +0900, Akira Yokosawa wrote:
> > On 2019/01/08 10:39:31 -0800, Paul E. McKenney wrote:
> > > On Wed, Jan 09, 2019 at 12:35:37AM +0900, Akira Yokosawa wrote:
> > >> On 2019/01/09 0:28, Paul E. McKenney wrote:
> > >>> On Tue, Jan 08, 2019 at 09:56:57AM +0800, Junchang Wang wrote:
> > >>>> On Tue, Jan 8, 2019 at 7:06 AM Akira Yokosawa <akiyks@gmail.com> wrote:
> > >>>>> On 2019/01/08 07:54:16 +0900, Akira Yokosawa wrote:
> 
> [ . . . ]
> 
> > >>>> Hi Paul and Akira,
> > >>>>
> > >>>> Thanks a lot for the comments, which I need some more time to look
> > >>>> into. For Paul's patch, I have a few concerns. Please take a look.
> > >>>>
> > >>>> My understanding is that with this path, during the time period when
> > >>>> the resizing thread is running, an updater may insert/delete an item
> > >>>> into/from the new hash table, while readers are still looking up data
> > >>>> in the old one, resulting the readers are unaware of
> > >>>> insertions/deletions happening simultaneously. For example, it seems
> > >>>> the following sequence could happen.
> > >>>>
> > >>>> 1. The resizing thread starts.
> > >>>> 2. The resizing thread successfully passes bucket *B* of the old hash table.
> > >>>> 3. An updater wants to insert a new item *I* which should be inserted
> > >>>> into bucket *B*.
> > >>>> 4. The updater will select the new hash table and insert the item *I*
> > >>>> into the new hash table.
> > >>>> 5. A read request comes in and wants to lookup item *I*. The lookup
> > >>>> request will check the old hash table and fail. Doesn't it?
> > >>>> 6. The resizing thread exits.
> > >>>> 7. Now subsequent read requests can successfully find item *I*.
> > >>>
> > >>> Yes, this can happen.
> > >>>
> > >>>> Is my understanding correct? Please let me know if I misunderstood
> > >>>> anything. Give the truth that this patch can accelerate the fast path,
> > >>>> I think it should be OK because resizing is typically happen rarely.
> > >>>> Just want to make sure I fully understand the algorithm.
> > >>>
> > >>> It is a design choice, and some users would prefer not to fail to see
> > >>> new items during a resize.  One approach would be to revert back to
> > >>> the old-style checking, and another would be to provide a separate
> > >>> lookup interface that synchronizes with adds and deletes.
> > >>>
> > >>> So, I could add a quick quiz with this information, I could revert the
> > >>> change, or I could add another lookup function that provided more timely
> > >>> information.  Left to myself, I would provide a quick quiz, but what
> > >>> do you guys think?
> > >>
> > >> Hi, I was composing a message, but now I'm replying to this one.
> > >> I think adding a quick quiz would be a good idea.
> > > 
> > > But in the meantime, it occurred to me that I was looking at the
> > > problem in the wrong way.  I believe that the following patch makes
> > > hashtab_lookup() find elements recently added by hashtab_add(), even
> > > during a resize, and without the need for memory barriers.
> > > 
> > > The scenario that convinced me to take this approach is when a thread
> > > does hashtab_add(), then immediately searches for the newly added element.
> > > Failing to find it would be quite a surprise to most people.
> > 
> > When a thread does hashtab_del() and immediately checks the deletion,
> > it still finds the deleted element while resizing is in progress.
> > This would also be a surprise. Current version looks less consistent
> > than the simpler one did.
> 
> I bet I can fix that...  Famous last words!  ;-)
> 
> But please see below and tell me what you think.

Well, that is not quite right, but close.  Working on it...

							Thanx, Paul

> ------------------------------------------------------------------------
> 
> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> index 6dbfe020d78d..632d9e27675b 100644
> --- a/CodeSamples/datastruct/hash/hash_resize.c
> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> @@ -257,9 +257,12 @@ void hashtab_add(struct ht_elem *htep,			//\lnlbl{add:b}
>  void hashtab_del(struct ht_elem *htep,			//\lnlbl{del:b}
>                   struct ht_lock_state *lsp)
>  {
> -	int i = lsp->hls_idx[!!lsp->hbp[1]];		//\lnlbl{del:i}
> +	int new = !!lsp->hbp[1];			//\lnlbl{del:new}
> +	int i = lsp->hls_idx[new];			//\lnlbl{del:i}
>  
>  	cds_list_del_rcu(&htep->hte_next[i]);		//\lnlbl{del:del}
> +	if (new)
> +		cds_list_del_rcu(&htep->hte_next[!i]);	//\lnlbl{del:del}
>  }							//\lnlbl{del:e}
>  //\end{snippet}
>  

