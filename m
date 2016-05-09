Return-Path: <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <57307D90.3050200@redhat.com>
Date: Mon, 9 May 2016 14:07:44 +0200
MIME-Version: 1.0
In-Reply-To: <571C1C8F.9000602@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Akira Yokosawa <akiyks@gmail.com>, paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



On 24/04/2016 03:08, Akira Yokosawa wrote:
> This commit also updates the copyright notices in the header,
> including the name of Paolo Bonzini who authored the commit
> mentioned above.

Not sure what's Paul's policy about copyright and authors in files (the
"Copyright (C)" stuff dates back to before the US joined the Berne
Convention; and authorship is recorded well in git logs).

Apart from this, I agree with the meat of the change. I didn't know
about the \newcounter{}[] syntax, hence my hack using \setcounter.

Thanks,

Paolo

