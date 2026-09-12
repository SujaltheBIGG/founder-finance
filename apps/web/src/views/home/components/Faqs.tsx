import Link from "next/link";
import {
  Disclosure,
  DisclosureButton,
  DisclosurePanel,
} from "@headlessui/react";
import { t } from "@lingui/core/macro";
import { Trans } from "@lingui/react/macro";
import { HiMiniMinusSmall, HiMiniPlusSmall } from "react-icons/hi2";

const Text = ({ children }: { children: React.ReactNode }) => {
  return (
    <p className="text-[14px] leading-[1.7rem] text-light-800 dark:text-dark-800">
      {children}
    </p>
  );
};

const Faqs = () => {
  const faqs = [
    {
      question: t`What is Founder Finance?`,
      answer: (
        <Text>
          {t`Founder Finance is a focused operating workspace for consulting firms. It keeps sales, delivery, client success, cash flow, and weekly priorities visible in one place.`}
        </Text>
      ),
    },
    {
      question: t`How is Founder Finance different from a generic task board?`,
      answer: (
        <Text>
          {t`Founder Finance is organised around the commercial rhythm of a consulting firm, with workflows for pipeline, engagements, retainers, invoicing, collections, and management reporting.`}
        </Text>
      ),
    },
    {
      question: t`How is the project funded?`,
      answer: (
        <Text>
          {t`For long-term sustainability, we recognise all good open source projects need a source of revenue. Ours comes from the paid cloud offering for workspaces with multiple users and for custom workspace slugs. There's no obligation to use it, and you can self-host the software on your own infrastructure free of charge.`}
        </Text>
      ),
    },
    {
      question: t`How do I import my Trello boards?`,
      answer: (
        <Text>
          <Trans>
            Importing your Trello boards into Founder Finance is easy. You can
            follow the setup notes in our step-by-step guide{" "}
            <Link
              href="https://github.com/SujaltheBIGG/founder-finance#readme"
              className="underline"
            >
              here
            </Link>
            .
          </Trans>
        </Text>
      ),
    },
    {
      question: t`How do I get a custom URL?`,
      answer: (
        <Text>
          <Trans>
            You can configure a custom workspace URL from your{" "}
            <Link href="/settings/workspace" className="underline">
              workspace settings
            </Link>{" "}
            when custom URLs are enabled for your plan.
          </Trans>
        </Text>
      ),
    },
    {
      question: t`Do you offer a free plan?`,
      answer: (
        <Text>
          {t`Yes, we offer an forever free plan for individual use. No restrictions, no paywalls, no limits.`}
        </Text>
      ),
    },
    {
      question: t`What license are you using?`,
      answer: (
        <Text>
          <Trans>
            We are using the{" "}
            <Link
              href="https://github.com/kan-bn/kan/blob/main/LICENSE"
              className="underline"
            >
              AGPL-3.0 license
            </Link>
            .
          </Trans>
        </Text>
      ),
    },
    {
      question: t`How do I invite team members?`,
      answer: (
        <Text>
          <Trans>
            You can invite team members by clicking the "Invite" button in the
            top right corner of the{" "}
            <Link href="/members" className="underline">
              members page
            </Link>{" "}
            and entering their email address. They will receive an email with a
            link to join the workspace.
          </Trans>
        </Text>
      ),
    },
    {
      question: t`How do I self-host?`,
      answer: (
        <Text>
          <Trans>
            You can self-host by following the instructions in our{" "}
            <Link
              href="https://github.com/SujaltheBIGG/founder-finance"
              className="underline"
            >
              repo
            </Link>
            .
          </Trans>
        </Text>
      ),
    },
  ];

  return (
    <div className="mx-auto max-w-[900px] px-4">
      <div className="flex flex-col items-center justify-center pb-12">
        <div className="flex items-center gap-2 rounded-full border bg-light-50 px-4 py-1 text-center text-xs text-light-1000 dark:border-dark-300 dark:bg-dark-50 dark:text-dark-900 lg:text-sm">
          <p>{t`FAQs`}</p>
        </div>

        <p className="mt-2 text-center text-3xl font-bold text-light-1000 dark:text-dark-1000 lg:text-4xl">
          {t`Questions?`}
        </p>
        <p className="text lg:text-md mt-3 max-w-[500px] text-center text-light-950 dark:text-dark-900">
          <Trans>
            Find answers to common questions about Founder Finance. Can't find
            what you're looking for? Feel free to{" "}
            <Link
              href="mailto:sujalgundalbusiness@gmail.com"
              className="underline"
            >
              contact us
            </Link>
            .
          </Trans>
        </p>
      </div>
      <div className="rounded-2xl bg-light-50 ring-1 ring-light-300 dark:bg-dark-50 dark:ring-dark-200">
        <div className="mx-auto max-w-7xl px-6 py-20 lg:px-16">
          <div className="mx-auto max-w-4xl">
            <dl className="divide-y divide-light-300 dark:divide-dark-200">
              {faqs.map((faq) => (
                <Disclosure
                  key={faq.question}
                  as="div"
                  className="py-5 first:pt-0 last:pb-0"
                >
                  <dt>
                    <DisclosureButton className="group flex w-full items-center justify-between text-left text-light-1000 dark:text-dark-1000">
                      <span className="text-[14px] font-semibold">
                        {faq.question}
                      </span>
                      <span className="ml-6 flex h-7 items-center text-light-800 dark:text-dark-800">
                        <HiMiniPlusSmall
                          aria-hidden="true"
                          className="size-6 group-data-[open]:hidden"
                        />
                        <HiMiniMinusSmall
                          aria-hidden="true"
                          className="size-6 group-[&:not([data-open])]:hidden"
                        />
                      </span>
                    </DisclosureButton>
                  </dt>
                  <DisclosurePanel as="dd" className="mt-2 pr-12">
                    {faq.answer}
                  </DisclosurePanel>
                </Disclosure>
              ))}
            </dl>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Faqs;
