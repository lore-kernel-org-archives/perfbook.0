Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e31.co.us.ibm.com ([32.97.110.149]:38864 "EHLO
 e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751379AbcEKI41 (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 11 May 2016
 04:56:27 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 11 May
 2016 02:56:26 -0600
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 C5F213E40030	for <perfbook@vger.kernel.org>; Wed, 11 May 2016 02:56:24 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4B8uO6V37552146	for <perfbook@vger.kernel.org>; Wed, 11 May 2016 08:56:24
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4B8uNd5018221	for <perfbook@vger.kernel.org>; Wed, 11 May 2016 04:56:24
 -0400
Date: Wed, 11 May 2016 01:56:26 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
Message-ID: <20160511085626.GD3515@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
 <57307D90.3050200@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57307D90.3050200@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Mon, May 09, 2016 at 02:07:44PM +0200, Paolo Bonzini wrote:
> 
> 
> On 24/04/2016 03:08, Akira Yokosawa wrote:
> > This commit also updates the copyright notices in the header,
> > including the name of Paolo Bonzini who authored the commit
> > mentioned above.
> 
> Not sure what's Paul's policy about copyright and authors in files (the
> "Copyright (C)" stuff dates back to before the US joined the Berne
> Convention; and authorship is recorded well in git logs).

My employer also dates before the Berne convention, so no problem here.

> Apart from this, I agree with the meat of the change. I didn't know
> about the \newcounter{}[] syntax, hence my hack using \setcounter.

I expect both the original and the improvement to be quite welcome,
especially for people reading this on small form-factor devices!

							Thanx, Paul

