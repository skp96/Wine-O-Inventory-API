export const Error: React.FC<{
    error: string
}> = ({ error }) => {
    return <h2 data-testid='error' className='error-style'>{error}</h2>
}
